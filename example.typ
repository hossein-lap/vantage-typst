#import "vantage-typst.typ": vantage, term, skill, cbox, styled-link
#let configuration = yaml("configuration.yml")

#vantage(
  name: configuration.contacts.name,
  position: configuration.position,
  links: (
    (name: "location-dot", link: "", display: configuration.contacts.address),
    (name: "globe", link: configuration.contacts.website.url, display: configuration.contacts.website.text),
    (name: "envelope", link: "mailto:"+ configuration.contacts.email),
    (name: "mobile-screen", link: "", display: configuration.contacts.phone),
    (name: "github", link: configuration.contacts.github.url, display: configuration.contacts.github.text),
    (name: "gitlab", link: configuration.contacts.gitlab.url, display: configuration.contacts.gitlab.text),
    (name: "linkedin", link: configuration.contacts.linkedin.url, display: configuration.contacts.linkedin.text),
  ),
  tagline: (configuration.tagline),
  [
    == Experience
    #for job in configuration.jobs [
      === #job.position \
      // •
      #link(job.company.link)[#text(size: 9pt, job.company.name)] - #styled-link(job.product.link)[#text(size: 8pt, job.product.name)] \
      #term[#job.from --- #job.to][#job.location]

      #for point in job.description [
        - #point
      ]
      #v(4pt)
    ]
    #v(4pt)

    == Projects
    #for item in configuration.projects [
      === #item.name
      #h(2fr)
      #link(item.url, text(size: 9pt, item.text))

      #for point in item.description [
        - #text(size: 9pt, point)
      ]
      #v(4pt)
    ]
    #v(4pt)
    
  ],
  [
    // == Objective
    //
    // #configuration.objective

    // == Technical Expertise
    //
    // #for item in configuration.technical_expertise [
    //   #skill(item.name, item.level)
    // ]

    == Skills
    #for item in configuration.skills [
      #cbox(item)
    ]
    #v(8pt)

    == Tools
    #for item in configuration.tools [
      #cbox(item)
    ]
    #v(8pt)

    == Programming
    #for item in configuration.programming [
      #cbox(item)
    ]
    #v(8pt)

    == Languages
    #for item in configuration.languages [
      - #item
    ]
    #v(8pt)

    == Certifications
    #for achievement in configuration.achievements [
      === #achievement.name
      #h(2fr)
      #text(size: 9pt, achievement.description)

    ]
    #v(8pt)

    == Education

    #for edu in configuration.education [
      === #if edu.place.link != "" [
        #link(edu.place.link)[#edu.place.name]\
      ] else [
        #edu.place.name\
      ]
      #edu.from - #edu.to #h(1fr) #edu.location
      #edu.degree in #edu.major

    ]

  ]
)
