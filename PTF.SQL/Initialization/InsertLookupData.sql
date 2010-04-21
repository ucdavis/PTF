-- == Note Types == --
insert into NoteTypes (NoteType, IsActive) values ('Induction', 1)
insert into NoteTypes (NoteType, IsActive) values ('Elongation/Germination', 1)
insert into NoteTypes (NoteType, IsActive) values ('Recallusing', 1)
insert into NoteTypes (NoteType, IsActive) values ('Rooting', 1)
insert into NoteTypes (NoteType, IsActive) values ('Co-Culture', 1)

-- == Status == --
Insert Into [Status] ([Status], IsActive, IsComplete, IsPlant) values ('Initiated', 1, 0, 1)
Insert Into [Status] ([Status], IsActive, IsComplete, IsPlant) values ('Dead', 1, 1, 1)
Insert Into [Status] ([Status], IsActive, IsComplete, IsPlant) values ('Shipped', 1, 1, 1)
Insert Into [Status] ([Status], IsActive, IsComplete, IsPlant) values ('Exempt', 1, 1, 0)
Insert Into [Status] ([Status], IsActive, IsComplete, IsPlant) values ('Pending', 1, 0, 0)
Insert Into [Status] ([Status], IsActive, IsComplete, IsPlant) values ('Complete', 1, 1, 0)
Insert Into [Status] ([Status], IsActive, IsComplete, IsPlant) values ('Cancelled', 1, 1, 0)

-- == States == --
insert into states (stateid, [name], isactive) values ('AK', 'Alaska', 1 )
insert into states (stateid, [name], isactive) values ('AL', 'Alabama', 1 )
insert into states (stateid, [name], isactive) values ('AR', 'Arkansas', 1 )
insert into states (stateid, [name], isactive) values ('AZ', 'Arizona', 1 )
insert into states (stateid, [name], isactive) values ('CA', 'California', 1 )
insert into states (stateid, [name], isactive) values ('CO', 'Colorado', 1 )
insert into states (stateid, [name], isactive) values ('CT', 'Connecticut', 1 )
insert into states (stateid, [name], isactive) values ('DC', 'District of Columbia', 1 )
insert into states (stateid, [name], isactive) values ('DE', 'Delaware', 1 )
insert into states (stateid, [name], isactive) values ('FL', 'Florida', 1 )
insert into states (stateid, [name], isactive) values ('GA', 'Georgia', 1 )
insert into states (stateid, [name], isactive) values ('HI', 'Hawaii', 1 )
insert into states (stateid, [name], isactive) values ('IA', 'Iowa', 1 )
insert into states (stateid, [name], isactive) values ('ID', 'Idaho', 1 )
insert into states (stateid, [name], isactive) values ('IL', 'Illinois', 1 )
insert into states (stateid, [name], isactive) values ('IN', 'Indiana', 1 )
insert into states (stateid, [name], isactive) values ('KS', 'Kansas', 1 )
insert into states (stateid, [name], isactive) values ('KY', 'Kentucky', 1 )
insert into states (stateid, [name], isactive) values ('LA', 'Louisiana', 1 )
insert into states (stateid, [name], isactive) values ('MA', 'Massachusetts', 1 )
insert into states (stateid, [name], isactive) values ('MD', 'Maryland', 1 )
insert into states (stateid, [name], isactive) values ('ME', 'Maine', 1 )
insert into states (stateid, [name], isactive) values ('MI', 'Michigan', 1 )
insert into states (stateid, [name], isactive) values ('MN', 'Minnesota', 1 )
insert into states (stateid, [name], isactive) values ('MO', 'Missouri', 1 )
insert into states (stateid, [name], isactive) values ('MS', 'Mississippi', 1 )
insert into states (stateid, [name], isactive) values ('MT', 'Montana', 1 )
insert into states (stateid, [name], isactive) values ('NC', 'North Carolina', 1 )
insert into states (stateid, [name], isactive) values ('ND', 'North Dakota', 1 )
insert into states (stateid, [name], isactive) values ('NE', 'Nebraska', 1 )
insert into states (stateid, [name], isactive) values ('NH', 'New Hampshire', 1 )
insert into states (stateid, [name], isactive) values ('NJ', 'New Jersey', 1 )
insert into states (stateid, [name], isactive) values ('NM', 'New Mexico', 1 )
insert into states (stateid, [name], isactive) values ('NV', 'Nevada', 1 )
insert into states (stateid, [name], isactive) values ('NY', 'New York', 1 )
insert into states (stateid, [name], isactive) values ('OH', 'Ohio', 1 )
insert into states (stateid, [name], isactive) values ('OK', 'Oklahoma', 1 )
insert into states (stateid, [name], isactive) values ('OR', 'Oregon', 1 )
insert into states (stateid, [name], isactive) values ('PA', 'Pennsylvania', 1 )
insert into states (stateid, [name], isactive) values ('RI', 'Rhode Island', 1 )
insert into states (stateid, [name], isactive) values ('SC', 'South Carolina', 1 )
insert into states (stateid, [name], isactive) values ('SD', 'South Dakota', 1 )
insert into states (stateid, [name], isactive) values ('TN', 'Tennessee', 1 )
insert into states (stateid, [name], isactive) values ('TX', 'Texas', 1 )
insert into states (stateid, [name], isactive) values ('UT', 'Utah', 1 )
insert into states (stateid, [name], isactive) values ('VA', 'Virginia', 1 )
insert into states (stateid, [name], isactive) values ('VT', 'Vermont', 1 )
insert into states (stateid, [name], isactive) values ('WA', 'Washington', 1 )
insert into states (stateid, [name], isactive) values ('WI', 'Wisconsin', 1 )
insert into states (stateid, [name], isactive) values ('WV', 'West Virginia', 1 )
insert into states (stateid, [name], isactive) values ('WY', 'Wyoming', 1 )

-- == Countries == --
insert into countries (countryid, name, isactive) values ('ABW', '(Aruba)', 1 )
insert into countries (countryid, name, isactive) values ('AFG', 'Afghanistan', 1 )
insert into countries (countryid, name, isactive) values ('AGO', 'Angola', 1 )
insert into countries (countryid, name, isactive) values ('AIA', '(Anguilla)', 0 )
insert into countries (countryid, name, isactive) values ('ALB', 'Albania', 1 )
insert into countries (countryid, name, isactive) values ('AND', 'Andorra', 1 )
insert into countries (countryid, name, isactive) values ('ANT', '(Netherlands Antilles)', 1 )
insert into countries (countryid, name, isactive) values ('ARE', 'United Arab Emirates', 1 )
insert into countries (countryid, name, isactive) values ('ARG', 'Argentina', 1 )
insert into countries (countryid, name, isactive) values ('ARM', 'Armenia', 1 )
insert into countries (countryid, name, isactive) values ('ASM', '(American Samoa)', 1 )
insert into countries (countryid, name, isactive) values ('ATA', '(Antarctica)', 1 )
insert into countries (countryid, name, isactive) values ('ATF', '(French Southern Territories)', 1 )
insert into countries (countryid, name, isactive) values ('ATG', 'Antigua and Barbuda', 1 )
insert into countries (countryid, name, isactive) values ('AUS', 'Australia', 1 )
insert into countries (countryid, name, isactive) values ('AUT', 'Austria', 1 )
insert into countries (countryid, name, isactive) values ('AZE', 'Azerbaijan', 1 )
insert into countries (countryid, name, isactive) values ('BDI', 'Burundi', 1 )
insert into countries (countryid, name, isactive) values ('BEL', 'Belgium', 1 )
insert into countries (countryid, name, isactive) values ('BEN', 'Benin', 1 )
insert into countries (countryid, name, isactive) values ('BFA', 'Burkina Faso', 1 )
insert into countries (countryid, name, isactive) values ('BGD', 'Bangladesh', 1 )
insert into countries (countryid, name, isactive) values ('BGR', 'Bulgaria', 1 )
insert into countries (countryid, name, isactive) values ('BHR', 'Bahrain', 1 )
insert into countries (countryid, name, isactive) values ('BHS', 'Bahamas', 1 )
insert into countries (countryid, name, isactive) values ('BIH', 'Bosnia and Herzegovina', 1 )
insert into countries (countryid, name, isactive) values ('BLR', 'Belarus', 1 )
insert into countries (countryid, name, isactive) values ('BLZ', 'Belize', 1 )
insert into countries (countryid, name, isactive) values ('BMU', '(Bermuda)', 1 )
insert into countries (countryid, name, isactive) values ('BOL', 'Bolivia', 1 )
insert into countries (countryid, name, isactive) values ('BRA', 'Brazil', 1 )
insert into countries (countryid, name, isactive) values ('BRB', 'Barbados', 1 )
insert into countries (countryid, name, isactive) values ('BRN', 'Brunei', 1 )
insert into countries (countryid, name, isactive) values ('BTN', 'Bhutan', 1 )
insert into countries (countryid, name, isactive) values ('BVT', '(Bouvet Island)', 1 )
insert into countries (countryid, name, isactive) values ('BWA', 'Botswana', 1 )
insert into countries (countryid, name, isactive) values ('CAF', 'Central African Republic', 1 )
insert into countries (countryid, name, isactive) values ('CAN', 'Canada', 1 )
insert into countries (countryid, name, isactive) values ('CCK', '(Cocos (Keeling) Islands)', 1 )
insert into countries (countryid, name, isactive) values ('CHE', 'Switzerland', 1 )
insert into countries (countryid, name, isactive) values ('CHL', 'Chile', 1 )
insert into countries (countryid, name, isactive) values ('CHN', 'People''s Republic of China', 1 )
insert into countries (countryid, name, isactive) values ('CIV', 'Côte d''Ivoire', 1 )
insert into countries (countryid, name, isactive) values ('CMR', 'Cameroon', 1 )
insert into countries (countryid, name, isactive) values ('COD', 'Democratic Republic of the Congo', 1 )
insert into countries (countryid, name, isactive) values ('COG', 'Republic of the Congo', 1 )
insert into countries (countryid, name, isactive) values ('COK', '(Cook Islands)', 1 )
insert into countries (countryid, name, isactive) values ('COL', 'Colombia', 1 )
insert into countries (countryid, name, isactive) values ('COM', 'Comoros', 1 )
insert into countries (countryid, name, isactive) values ('CPV', 'Cape Verde', 1 )
insert into countries (countryid, name, isactive) values ('CRI', 'Costa Rica', 1 )
insert into countries (countryid, name, isactive) values ('CUB', 'Cuba', 1 )
insert into countries (countryid, name, isactive) values ('CXR', '(Christmas Island)', 1 )
insert into countries (countryid, name, isactive) values ('CYM', '(Cayman Islands)', 1 )
insert into countries (countryid, name, isactive) values ('CYP', 'Cyprus', 1 )
insert into countries (countryid, name, isactive) values ('CZE', 'Czech Republic', 1 )
insert into countries (countryid, name, isactive) values ('DEU', 'Germany', 1 )
insert into countries (countryid, name, isactive) values ('DJI', 'Djibouti', 1 )
insert into countries (countryid, name, isactive) values ('DMA', 'Dominica', 1 )
insert into countries (countryid, name, isactive) values ('DNK', 'Denmark', 1 )
insert into countries (countryid, name, isactive) values ('DOM', 'Dominican Republic', 1 )
insert into countries (countryid, name, isactive) values ('DZA', 'Algeria', 1 )
insert into countries (countryid, name, isactive) values ('ECU', 'Ecuador', 1 )
insert into countries (countryid, name, isactive) values ('EGY', 'Egypt', 1 )
insert into countries (countryid, name, isactive) values ('ERI', 'Eritrea', 1 )
insert into countries (countryid, name, isactive) values ('ESH', '(Western Sahara)', 1 )
insert into countries (countryid, name, isactive) values ('ESP', 'Spain', 1 )
insert into countries (countryid, name, isactive) values ('EST', 'Estonia', 1 )
insert into countries (countryid, name, isactive) values ('ETH', 'Ethiopia', 1 )
insert into countries (countryid, name, isactive) values ('FIN', 'Finland', 1 )
insert into countries (countryid, name, isactive) values ('FJI', 'Fiji', 1 )
insert into countries (countryid, name, isactive) values ('FLK', '(Falkland Islands/Islas Malvinas)', 1 )
insert into countries (countryid, name, isactive) values ('FRA', 'France', 1 )
insert into countries (countryid, name, isactive) values ('FRO', '(Faroe Islands)', 1 )
insert into countries (countryid, name, isactive) values ('FSM', 'Federated States of Micronesia', 1 )
insert into countries (countryid, name, isactive) values ('GAB', 'Gabon', 1 )
insert into countries (countryid, name, isactive) values ('GBR', 'United Kingdom', 1 )
insert into countries (countryid, name, isactive) values ('GEO', 'Georgia', 1 )
insert into countries (countryid, name, isactive) values ('GHA', 'Ghana', 1 )
insert into countries (countryid, name, isactive) values ('GIB', '(Gibraltar)', 1 )
insert into countries (countryid, name, isactive) values ('GIN', 'Guinea', 1 )
insert into countries (countryid, name, isactive) values ('GLP', '(Guadeloupe)', 1 )
insert into countries (countryid, name, isactive) values ('GMB', 'The Gambia', 1 )
insert into countries (countryid, name, isactive) values ('GNB', 'Guinea-Bissau', 1 )
insert into countries (countryid, name, isactive) values ('GNQ', 'Equatorial Guinea', 1 )
insert into countries (countryid, name, isactive) values ('GRC', 'Greece', 1 )
insert into countries (countryid, name, isactive) values ('GRD', 'Grenada', 1 )
insert into countries (countryid, name, isactive) values ('GRL', '(Greenland)', 1 )
insert into countries (countryid, name, isactive) values ('GTM', 'Guatemala', 1 )
insert into countries (countryid, name, isactive) values ('GUF', '(French Guiana)', 1 )
insert into countries (countryid, name, isactive) values ('GUM', '(Guam)', 1 )
insert into countries (countryid, name, isactive) values ('GUY', 'Guyana', 1 )
insert into countries (countryid, name, isactive) values ('HKG', '(Hong Kong)', 1 )
insert into countries (countryid, name, isactive) values ('HMD', '(Heard Island and McDonald Islands)', 1 )
insert into countries (countryid, name, isactive) values ('HND', 'Honduras', 1 )
insert into countries (countryid, name, isactive) values ('HRV', 'Croatia', 1 )
insert into countries (countryid, name, isactive) values ('HTI', 'Haiti', 1 )
insert into countries (countryid, name, isactive) values ('HUN', 'Hungary', 1 )
insert into countries (countryid, name, isactive) values ('IDN', 'Indonesia', 1 )
insert into countries (countryid, name, isactive) values ('IND', 'India', 1 )
insert into countries (countryid, name, isactive) values ('IOT', '(British Indian Ocean Territory)', 1 )
insert into countries (countryid, name, isactive) values ('IRL', 'Republic of Ireland', 1 )
insert into countries (countryid, name, isactive) values ('IRN', 'Iran', 1 )
insert into countries (countryid, name, isactive) values ('IRQ', 'Iraq', 1 )
insert into countries (countryid, name, isactive) values ('ISL', 'Iceland', 1 )
insert into countries (countryid, name, isactive) values ('ISR', 'Israel', 1 )
insert into countries (countryid, name, isactive) values ('ITA', 'Italy', 1 )
insert into countries (countryid, name, isactive) values ('JAM', 'Jamaica', 1 )
insert into countries (countryid, name, isactive) values ('JOR', 'Jordan', 1 )
insert into countries (countryid, name, isactive) values ('JPN', 'Japan', 1 )
insert into countries (countryid, name, isactive) values ('KAZ', 'Kazakhstan', 1 )
insert into countries (countryid, name, isactive) values ('KEN', 'Kenya', 1 )
insert into countries (countryid, name, isactive) values ('KGZ', 'Kyrgyzstan', 1 )
insert into countries (countryid, name, isactive) values ('KHM', 'Cambodia', 1 )
insert into countries (countryid, name, isactive) values ('KIR', 'Kiribati', 1 )
insert into countries (countryid, name, isactive) values ('KNA', 'Saint Kitts and Nevis', 1 )
insert into countries (countryid, name, isactive) values ('KOR', 'South Korea', 1 )
insert into countries (countryid, name, isactive) values ('KWT', 'Kuwait', 1 )
insert into countries (countryid, name, isactive) values ('LAO', 'Laos', 1 )
insert into countries (countryid, name, isactive) values ('LBN', 'Lebanon', 1 )
insert into countries (countryid, name, isactive) values ('LBR', 'Liberia', 1 )
insert into countries (countryid, name, isactive) values ('LBY', 'Libya', 1 )
insert into countries (countryid, name, isactive) values ('LCA', 'Saint Lucia', 1 )
insert into countries (countryid, name, isactive) values ('LIE', 'Liechtenstein', 1 )
insert into countries (countryid, name, isactive) values ('LKA', 'Sri Lanka', 1 )
insert into countries (countryid, name, isactive) values ('LSO', 'Lesotho', 1 )
insert into countries (countryid, name, isactive) values ('LTU', 'Lithuania', 1 )
insert into countries (countryid, name, isactive) values ('LUX', 'Luxembourg', 1 )
insert into countries (countryid, name, isactive) values ('LVA', 'Latvia', 1 )
insert into countries (countryid, name, isactive) values ('MAC', '(Macau)', 1 )
insert into countries (countryid, name, isactive) values ('MAR', 'Morocco', 1 )
insert into countries (countryid, name, isactive) values ('MCO', 'Monaco', 1 )
insert into countries (countryid, name, isactive) values ('MDA', 'Moldova', 1 )
insert into countries (countryid, name, isactive) values ('MDG', 'Madagascar', 1 )
insert into countries (countryid, name, isactive) values ('MDV', 'Maldives', 1 )
insert into countries (countryid, name, isactive) values ('MEX', 'Mexico', 1 )
insert into countries (countryid, name, isactive) values ('MHL', 'Marshall Islands', 1 )
insert into countries (countryid, name, isactive) values ('MKD', 'Republic of Macedonia', 1 )
insert into countries (countryid, name, isactive) values ('MLI', 'Mali', 1 )
insert into countries (countryid, name, isactive) values ('MLT', 'Malta', 1 )
insert into countries (countryid, name, isactive) values ('MMR', 'Myanmar', 1 )
insert into countries (countryid, name, isactive) values ('MNG', 'Mongolia', 1 )
insert into countries (countryid, name, isactive) values ('MNP', '(Northern Mariana Islands)', 1 )
insert into countries (countryid, name, isactive) values ('MOZ', 'Mozambique', 1 )
insert into countries (countryid, name, isactive) values ('MRT', 'Mauritania', 1 )
insert into countries (countryid, name, isactive) values ('MSR', '(Montserrat)', 1 )
insert into countries (countryid, name, isactive) values ('MTQ', '(Martinique)', 1 )
insert into countries (countryid, name, isactive) values ('MUS', 'Mauritius', 1 )
insert into countries (countryid, name, isactive) values ('MWI', 'Malawi', 1 )
insert into countries (countryid, name, isactive) values ('MYS', 'Malaysia', 1 )
insert into countries (countryid, name, isactive) values ('MYT', '(Mayotte)', 1 )
insert into countries (countryid, name, isactive) values ('NAM', 'Namibia', 1 )
insert into countries (countryid, name, isactive) values ('NCL', '(New Caledonia)', 1 )
insert into countries (countryid, name, isactive) values ('NER', 'Niger', 1 )
insert into countries (countryid, name, isactive) values ('NFK', '(Norfolk Island)', 1 )
insert into countries (countryid, name, isactive) values ('NGA', 'Nigeria', 1 )
insert into countries (countryid, name, isactive) values ('NIC', 'Nicaragua', 1 )
insert into countries (countryid, name, isactive) values ('NIU', '(Niue)', 1 )
insert into countries (countryid, name, isactive) values ('NLD', 'Netherlands', 1 )
insert into countries (countryid, name, isactive) values ('NOR', 'Norway', 1 )
insert into countries (countryid, name, isactive) values ('NPL', 'Nepal', 1 )
insert into countries (countryid, name, isactive) values ('NRU', 'Nauru', 1 )
insert into countries (countryid, name, isactive) values ('NZL', 'New Zealand', 1 )
insert into countries (countryid, name, isactive) values ('OMN', 'Oman', 1 )
insert into countries (countryid, name, isactive) values ('PAK', 'Pakistan', 1 )
insert into countries (countryid, name, isactive) values ('PAN', 'Panama', 1 )
insert into countries (countryid, name, isactive) values ('PCN', '(Pitcairn Islands)', 1 )
insert into countries (countryid, name, isactive) values ('PER', 'Peru', 1 )
insert into countries (countryid, name, isactive) values ('PHL', 'Philippines', 1 )
insert into countries (countryid, name, isactive) values ('PLW', 'Palau', 1 )
insert into countries (countryid, name, isactive) values ('PNG', 'Papua New Guinea', 1 )
insert into countries (countryid, name, isactive) values ('POL', 'Poland', 1 )
insert into countries (countryid, name, isactive) values ('PRI', '(Puerto Rico)', 1 )
insert into countries (countryid, name, isactive) values ('PRK', 'North Korea', 1 )
insert into countries (countryid, name, isactive) values ('PRT', 'Portugal', 1 )
insert into countries (countryid, name, isactive) values ('PRY', 'Paraguay', 1 )
insert into countries (countryid, name, isactive) values ('PYF', '(French Polynesia)', 1 )
insert into countries (countryid, name, isactive) values ('QAT', 'Qatar', 1 )
insert into countries (countryid, name, isactive) values ('REU', '(Réunion)', 1 )
insert into countries (countryid, name, isactive) values ('ROU', 'Romania', 1 )
insert into countries (countryid, name, isactive) values ('RUS', 'Russia', 1 )
insert into countries (countryid, name, isactive) values ('RWA', 'Rwanda', 1 )
insert into countries (countryid, name, isactive) values ('SAU', 'Saudi Arabia', 1 )
insert into countries (countryid, name, isactive) values ('SCG', 'Serbia', 1 )
insert into countries (countryid, name, isactive) values ('SDN', 'Sudan', 1 )
insert into countries (countryid, name, isactive) values ('SEN', 'Senegal', 1 )
insert into countries (countryid, name, isactive) values ('SGP', 'Singapore', 1 )
insert into countries (countryid, name, isactive) values ('SGS', '(South Georgia and the South Sandwich Islands)', 1 )
insert into countries (countryid, name, isactive) values ('SHN', '(Saint Helena)', 1 )
insert into countries (countryid, name, isactive) values ('SJM', '(Svalbard)', 1 )
insert into countries (countryid, name, isactive) values ('SLB', 'Solomon Islands', 1 )
insert into countries (countryid, name, isactive) values ('SLE', 'Sierra Leone', 1 )
insert into countries (countryid, name, isactive) values ('SLV', 'El Salvador', 1 )
insert into countries (countryid, name, isactive) values ('SMR', 'San Marino', 1 )
insert into countries (countryid, name, isactive) values ('SOM', 'Somalia', 1 )
insert into countries (countryid, name, isactive) values ('SPM', '(Saint Pierre and Miquelon)', 1 )
insert into countries (countryid, name, isactive) values ('STP', 'São Tomé and Príncipe', 1 )
insert into countries (countryid, name, isactive) values ('SUR', 'Suriname', 1 )
insert into countries (countryid, name, isactive) values ('SVK', 'Slovakia', 1 )
insert into countries (countryid, name, isactive) values ('SVN', 'Slovenia', 1 )
insert into countries (countryid, name, isactive) values ('SWE', 'Sweden', 1 )
insert into countries (countryid, name, isactive) values ('SWZ', 'Swaziland', 1 )
insert into countries (countryid, name, isactive) values ('SYC', 'Seychelles', 1 )
insert into countries (countryid, name, isactive) values ('SYR', 'Syria', 1 )
insert into countries (countryid, name, isactive) values ('TCA', '(Turks and Caicos Islands)', 1 )
insert into countries (countryid, name, isactive) values ('TCD', 'Chad', 1 )
insert into countries (countryid, name, isactive) values ('TGO', 'Togo', 1 )
insert into countries (countryid, name, isactive) values ('THA', 'Thailand', 1 )
insert into countries (countryid, name, isactive) values ('TJK', 'Tajikistan', 1 )
insert into countries (countryid, name, isactive) values ('TKL', '(Tokelau)', 1 )
insert into countries (countryid, name, isactive) values ('TKM', 'Turkmenistan', 1 )
insert into countries (countryid, name, isactive) values ('TLS', 'Timor-Leste/East Timor (recent update: see FIPS pu', 1 )
insert into countries (countryid, name, isactive) values ('TON', 'Tonga', 1 )
insert into countries (countryid, name, isactive) values ('TTO', 'Trinidad and Tobago', 1 )
insert into countries (countryid, name, isactive) values ('TUN', 'Tunisia', 1 )
insert into countries (countryid, name, isactive) values ('TUR', 'Turkey', 1 )
insert into countries (countryid, name, isactive) values ('TUV', 'Tuvalu', 1 )
insert into countries (countryid, name, isactive) values ('TWN', 'Republic of China (Taiwan)', 1 )
insert into countries (countryid, name, isactive) values ('TZA', 'Tanzania', 1 )
insert into countries (countryid, name, isactive) values ('UGA', 'Republic of Uganda', 1 )
insert into countries (countryid, name, isactive) values ('UKR', 'Ukraine', 1 )
insert into countries (countryid, name, isactive) values ('UNK', 'Unknown', 0 )
insert into countries (countryid, name, isactive) values ('URY', 'Uruguay', 1 )
insert into countries (countryid, name, isactive) values ('USA', 'United States', 1 )
insert into countries (countryid, name, isactive) values ('UZB', 'Uzbekistan', 1 )
insert into countries (countryid, name, isactive) values ('VAT', 'Vatican City', 1 )
insert into countries (countryid, name, isactive) values ('VCT', 'Saint Vincent and the Grenadines', 1 )
insert into countries (countryid, name, isactive) values ('VEN', 'Venezuela', 1 )
insert into countries (countryid, name, isactive) values ('VGB', '(British Virgin Islands)', 1 )
insert into countries (countryid, name, isactive) values ('VIR', '(U.S. Virgin Islands)', 1 )
insert into countries (countryid, name, isactive) values ('VNM', 'Vietnam', 1 )
insert into countries (countryid, name, isactive) values ('VUT', 'Vanuatu', 1 )
insert into countries (countryid, name, isactive) values ('WLF', '(Wallis and Futuna)', 1 )
insert into countries (countryid, name, isactive) values ('WSM', 'Samoa', 1 )
insert into countries (countryid, name, isactive) values ('YEM', 'Yemen', 1 )
insert into countries (countryid, name, isactive) values ('ZAF', 'South Africa', 1 )
insert into countries (countryid, name, isactive) values ('ZMB', 'Zambia', 1 )
insert into countries (countryid, name, isactive) values ('ZWE', 'Zimbabwe', 1 )

-- == Crop == --
insert into crops (crop, isactive) values ('Alfalfa', 1)
insert into crops (crop, isactive) values ('Canola', 1)
insert into crops (crop, isactive) values ('Carrot', 1)
insert into crops (crop, isactive) values ('Citrus', 1)
insert into crops (crop, isactive) values ('Cucumber', 1)
insert into crops (crop, isactive) values ('Grape', 1)
insert into crops (crop, isactive) values ('Lettuce', 1)
insert into crops (crop, isactive) values ('Melon', 1)
insert into crops (crop, isactive) values ('Mimulus', 1)
insert into crops (crop, isactive) values ('Pepper', 1)
insert into crops (crop, isactive) values ('Petunia', 1)
insert into crops (crop, isactive) values ('Potato', 1)
insert into crops (crop, isactive) values ('Rice', 1)
insert into crops (crop, isactive) values ('Tobacco', 1)
insert into crops (crop, isactive) values ('Tomato', 1)
insert into crops (crop, isactive) values ('Truncatula', 1)
insert into crops (crop, isactive) values ('Walnut', 1)

-- == TransGenes == --
insert into TransGenes (TransGene, isactive) values ('Agronomic Properties', 1)
insert into TransGenes (TransGene, isactive) values ('Fungus Resistant', 1)
insert into TransGenes (TransGene, isactive) values ('Herbicide Tolerant', 1)
insert into TransGenes (TransGene, isactive) values ('Insect Resistant', 1)
insert into TransGenes (TransGene, isactive) values ('Marker Genes', 1)
insert into TransGenes (TransGene, isactive) values ('Nematode Resistant', 1)
insert into TransGenes (TransGene, isactive) values ('Product Quality', 1)
insert into TransGenes (TransGene, isactive) values ('Virus Resistant', 1)
insert into TransGenes (TransGene, isactive) values ('Other', 1)

-- == Genotypes == --

declare @Cropid int, @Genotypeid int

insert into genotypes (genotype, isactive) values ('Other', 1)

	-- alfalfa
insert into genotypes (genotype, isactive) values ('Regen SY4', 1)
insert into genotypes (genotype, isactive) values ('Regen S7', 1)
insert into genotypes (genotype, isactive) values ('UC2525-14', 1)
insert into genotypes (genotype, isactive) values ('R97-37-1', 1)
insert into genotypes (genotype, isactive) values ('RC97-37-5', 1)

	-- Crop Associations
	select @cropid = cropid from crops where crop = 'Alfalfa'
	
	select @genotypeid = genotypeid from genotypes where genotype = 'Regen SY4'
	insert into CropXGenotypes (CropID, GenotypeID) values (@cropid, @genotypeid)
	
	select @genotypeid = genotypeid from genotypes where genotype = 'Regen S7'
	insert into CropXGenotypes (CropID, GenotypeID) values (@cropid, @genotypeid)
	
	select @genotypeid = genotypeid from genotypes where genotype = 'UC2525-14'
	insert into CropXGenotypes (CropID, GenotypeID) values (@cropid, @genotypeid)
	
	select @genotypeid = genotypeid from genotypes where genotype = 'R97-37-1'
	insert into CropXGenotypes (CropID, GenotypeID) values (@cropid, @genotypeid)
	
	select @genotypeid = genotypeid from genotypes where genotype = 'RC97-37-5'
	insert into CropXGenotypes (CropID, GenotypeID) values (@cropid, @genotypeid)

	select @genotypeid = genotypeid from genotypes where genotype = 'Other'
	insert into CropXGenotypes (CropID, GenotypeID) values (@cropid, @genotypeid)

	-- Canola
insert into genotypes (genotype, isactive) values ('Westar', 1)

	-- Crop Associations
	select @cropid = cropid from crops where crop = 'Canola'
	
	select @genotypeid = genotypeid from genotypes where genotype = 'Westar'
	insert into CropXGenotypes (CropID, GenotypeID) values (@cropid, @genotypeid)	
	
	select @genotypeid = genotypeid from genotypes where genotype = 'Other'
	insert into CropXGenotypes (CropID, GenotypeID) values (@cropid, @genotypeid)

	-- Carrot
insert into genotypes (genotype, isactive) values ('Imperator', 1)

	select @cropid = cropid from crops where crop = 'Carrot'
	
	select @genotypeid = genotypeid from genotypes where genotype = 'Imperator'
	insert into CropXGenotypes (CropID, GenotypeID) values (@cropid, @genotypeid)	
	
	select @genotypeid = genotypeid from genotypes where genotype = 'Other'
	insert into CropXGenotypes (CropID, GenotypeID) values (@cropid, @genotypeid)

	-- Citrus
insert into genotypes (genotype, isactive) values ('Carrizo', 1)

	select @cropid = cropid from crops where crop = 'Citrus'
	
	select @genotypeid = genotypeid from genotypes where genotype = 'Carrizo'
	insert into CropXGenotypes (CropID, GenotypeID) values (@cropid, @genotypeid)	
	
	select @genotypeid = genotypeid from genotypes where genotype = 'Other'
	insert into CropXGenotypes (CropID, GenotypeID) values (@cropid, @genotypeid)

	-- Cucumber
	
	select @cropid = cropid from crops where crop = 'Cucumber'
	
	select @genotypeid = genotypeid from genotypes where genotype = 'Other'
	insert into CropXGenotypes (CropID, GenotypeID) values (@cropid, @genotypeid)
	
	-- Grape
insert into genotypes (genotype, isactive) values ('Thompson Seedless', 1)

	select @cropid = cropid from crops where crop = 'Grape'
	
	select @genotypeid = genotypeid from genotypes where genotype = 'Thompson Seedless'
	insert into CropXGenotypes (CropID, GenotypeID) values (@cropid, @genotypeid)	
	
	select @genotypeid = genotypeid from genotypes where genotype = 'Other'
	insert into CropXGenotypes (CropID, GenotypeID) values (@cropid, @genotypeid)

	-- Lettuce
insert into genotypes (genotype, isactive) values ('Cobbum Green', 1)
insert into genotypes (genotype, isactive) values ('Diana', 1)
insert into genotypes (genotype, isactive) values ('Mariska', 1)
insert into genotypes (genotype, isactive) values ('Ninja', 1)
insert into genotypes (genotype, isactive) values ('Summer Bibb', 1)
insert into genotypes (genotype, isactive) values ('Valmaine', 1)

	select @cropid = cropid from crops where crop = 'Lettuce'
	
	select @genotypeid = genotypeid from genotypes where genotype = 'Cobbum Green'
	insert into CropXGenotypes (CropID, GenotypeID) values (@cropid, @genotypeid)	
	
	select @genotypeid = genotypeid from genotypes where genotype = 'Diana'
	insert into CropXGenotypes (CropID, GenotypeID) values (@cropid, @genotypeid)	
	
	select @genotypeid = genotypeid from genotypes where genotype = 'Mariska'
	insert into CropXGenotypes (CropID, GenotypeID) values (@cropid, @genotypeid)	
	
	select @genotypeid = genotypeid from genotypes where genotype = 'Ninja'
	insert into CropXGenotypes (CropID, GenotypeID) values (@cropid, @genotypeid)	
	
	select @genotypeid = genotypeid from genotypes where genotype = 'Summer Bibb'
	insert into CropXGenotypes (CropID, GenotypeID) values (@cropid, @genotypeid)	
	
	select @genotypeid = genotypeid from genotypes where genotype = 'Valmaine'
	insert into CropXGenotypes (CropID, GenotypeID) values (@cropid, @genotypeid)	
	
	select @genotypeid = genotypeid from genotypes where genotype = 'Other'
	insert into CropXGenotypes (CropID, GenotypeID) values (@cropid, @genotypeid)
	
	-- Melon
	
	select @cropid = cropid from crops where crop = 'Melon'
	
	select @genotypeid = genotypeid from genotypes where genotype = 'Other'
	insert into CropXGenotypes (CropID, GenotypeID) values (@cropid, @genotypeid)
	
	-- Mimulus
insert into genotypes (genotype, isactive) values ('gattatus', 1)
insert into genotypes (genotype, isactive) values ('nasutus', 1)

	select @cropid = cropid from crops where crop = 'Mimulus'
	
	select @genotypeid = genotypeid from genotypes where genotype = 'gattatus'
	insert into CropXGenotypes (CropID, GenotypeID) values (@cropid, @genotypeid)	

	select @genotypeid = genotypeid from genotypes where genotype = 'nasutus'
	insert into CropXGenotypes (CropID, GenotypeID) values (@cropid, @genotypeid)
	
	select @genotypeid = genotypeid from genotypes where genotype = 'Other'
	insert into CropXGenotypes (CropID, GenotypeID) values (@cropid, @genotypeid)	

	-- Pepper
insert into genotypes (genotype, isactive) values ('R&C Cayenne', 1)

	select @cropid = cropid from crops where crop = 'Pepper'
	
	select @genotypeid = genotypeid from genotypes where genotype = 'R&C Cayenne'
	insert into CropXGenotypes (CropID, GenotypeID) values (@cropid, @genotypeid)
	
	select @genotypeid = genotypeid from genotypes where genotype = 'Other'
	insert into CropXGenotypes (CropID, GenotypeID) values (@cropid, @genotypeid)	
	
	-- Petunia
insert into genotypes (genotype, isactive) values ('Mitchell', 1)

	select @cropid = cropid from crops where crop = 'Petunia'
	
	select @genotypeid = genotypeid from genotypes where genotype = 'Mitchell'
	insert into CropXGenotypes (CropID, GenotypeID) values (@cropid, @genotypeid)	
	
	select @genotypeid = genotypeid from genotypes where genotype = 'Other'
	insert into CropXGenotypes (CropID, GenotypeID) values (@cropid, @genotypeid)
	
	-- Potato
insert into genotypes (genotype, isactive) values ('Kennebec', 1)

	select @cropid = cropid from crops where crop = 'Potato'
	
	select @genotypeid = genotypeid from genotypes where genotype = 'Kennebec'
	insert into CropXGenotypes (CropID, GenotypeID) values (@cropid, @genotypeid)
	
	select @genotypeid = genotypeid from genotypes where genotype = 'Other'
	insert into CropXGenotypes (CropID, GenotypeID) values (@cropid, @genotypeid)	
	
	-- Rice
insert into genotypes (genotype, isactive) values ('Kitaake', 1)
insert into genotypes (genotype, isactive) values ('Nipponbare', 1)

	select @cropid = cropid from crops where crop = 'Rice'
	
	select @genotypeid = genotypeid from genotypes where genotype = 'Kitaake'
	insert into CropXGenotypes (CropID, GenotypeID) values (@cropid, @genotypeid)	
	
	select @genotypeid = genotypeid from genotypes where genotype = 'Nipponbare'
	insert into CropXGenotypes (CropID, GenotypeID) values (@cropid, @genotypeid)	
	
	select @genotypeid = genotypeid from genotypes where genotype = 'Other'
	insert into CropXGenotypes (CropID, GenotypeID) values (@cropid, @genotypeid)
	
	-- Tobacco
insert into genotypes (genotype, isactive) values ('Benthamiana', 1)
insert into genotypes (genotype, isactive) values ('Maryland Mammoth', 1)
insert into genotypes (genotype, isactive) values ('Rastroensis', 1)
insert into genotypes (genotype, isactive) values ('Samsun', 1)
insert into genotypes (genotype, isactive) values ('Samsun NN', 1)
insert into genotypes (genotype, isactive) values ('SR1', 1)
insert into genotypes (genotype, isactive) values ('Sylvestris', 1)
insert into genotypes (genotype, isactive) values ('TI1347', 1)
insert into genotypes (genotype, isactive) values ('Xanthi', 1)

	select @cropid = cropid from crops where crop = 'Tobacco'
	
	select @genotypeid = genotypeid from genotypes where genotype = 'Benthamiana'
	insert into CropXGenotypes (CropID, GenotypeID) values (@cropid, @genotypeid)	

	select @genotypeid = genotypeid from genotypes where genotype = 'Maryland Mammoth'
	insert into CropXGenotypes (CropID, GenotypeID) values (@cropid, @genotypeid)	
	
	select @genotypeid = genotypeid from genotypes where genotype = 'Rastroensis'
	insert into CropXGenotypes (CropID, GenotypeID) values (@cropid, @genotypeid)	
	
	select @genotypeid = genotypeid from genotypes where genotype = 'Samsun'
	insert into CropXGenotypes (CropID, GenotypeID) values (@cropid, @genotypeid)	
	
	select @genotypeid = genotypeid from genotypes where genotype = 'Samsun NN'
	insert into CropXGenotypes (CropID, GenotypeID) values (@cropid, @genotypeid)	
	
	select @genotypeid = genotypeid from genotypes where genotype = 'SR1'
	insert into CropXGenotypes (CropID, GenotypeID) values (@cropid, @genotypeid)	
	
	select @genotypeid = genotypeid from genotypes where genotype = 'Sylvestris'
	insert into CropXGenotypes (CropID, GenotypeID) values (@cropid, @genotypeid)	
	
	select @genotypeid = genotypeid from genotypes where genotype = 'TI1347'
	insert into CropXGenotypes (CropID, GenotypeID) values (@cropid, @genotypeid)	
	
	select @genotypeid = genotypeid from genotypes where genotype = 'Xanthi'
	insert into CropXGenotypes (CropID, GenotypeID) values (@cropid, @genotypeid)	
	
	select @genotypeid = genotypeid from genotypes where genotype = 'Other'
	insert into CropXGenotypes (CropID, GenotypeID) values (@cropid, @genotypeid)
	
	-- Tomato
insert into genotypes (genotype, isactive) values ('Ailsa Craig', 1)
insert into genotypes (genotype, isactive) values ('Microtom', 1)
insert into genotypes (genotype, isactive) values ('Moneymaker', 1)
insert into genotypes (genotype, isactive) values ('T5', 1)
insert into genotypes (genotype, isactive) values ('VF36', 1)
insert into genotypes (genotype, isactive) values ('10 56E', 1)

	select @cropid = cropid from crops where crop = 'Tomato'
	
	select @genotypeid = genotypeid from genotypes where genotype = 'Ailsa Craig'
	insert into CropXGenotypes (CropID, GenotypeID) values (@cropid, @genotypeid)
	
	select @genotypeid = genotypeid from genotypes where genotype = 'Microtom'
	insert into CropXGenotypes (CropID, GenotypeID) values (@cropid, @genotypeid)
	
	select @genotypeid = genotypeid from genotypes where genotype = 'Moneymaker'
	insert into CropXGenotypes (CropID, GenotypeID) values (@cropid, @genotypeid)
	
	select @genotypeid = genotypeid from genotypes where genotype = 'T5'
	insert into CropXGenotypes (CropID, GenotypeID) values (@cropid, @genotypeid)
	
	select @genotypeid = genotypeid from genotypes where genotype = 'VF36'
	insert into CropXGenotypes (CropID, GenotypeID) values (@cropid, @genotypeid)
	
	select @genotypeid = genotypeid from genotypes where genotype = '10 56E'
	insert into CropXGenotypes (CropID, GenotypeID) values (@cropid, @genotypeid)
	
	select @genotypeid = genotypeid from genotypes where genotype = 'Other'
	insert into CropXGenotypes (CropID, GenotypeID) values (@cropid, @genotypeid)
	
	-- Truncatula
insert into genotypes (genotype, isactive) values ('A17', 1)

	select @cropid = cropid from crops where crop = 'Truncatula'
	
	select @genotypeid = genotypeid from genotypes where genotype = 'A17'
	insert into CropXGenotypes (CropID, GenotypeID) values (@cropid, @genotypeid)	
	
	select @genotypeid = genotypeid from genotypes where genotype = 'Other'
	insert into CropXGenotypes (CropID, GenotypeID) values (@cropid, @genotypeid)
	
	-- Walnut
insert into genotypes (genotype, isactive) values ('PX-1', 1)

	select @cropid = cropid from crops where crop = 'Walnut'
	
	select @genotypeid = genotypeid from genotypes where genotype = 'PX-1'
	insert into CropXGenotypes (CropID, GenotypeID) values (@cropid, @genotypeid)	
	
	select @genotypeid = genotypeid from genotypes where genotype = 'Other'
	insert into CropXGenotypes (CropID, GenotypeID) values (@cropid, @genotypeid)

-- == Plant Selections == --
declare @plantSelectionID int

insert into plantselections (plantselection, isactive) values ('kanamycin', 1)

	select @plantSelectionID = plantselectionid from plantselections where plantselection = 'kanamycin'
	
	select @cropid = cropid from crops where crop = 'Alfalfa'
	insert into CropXPlantSelection (cropid, plantselectionid) values (@cropid, @plantselectionid)
	
	select @cropid = cropid from crops where crop = 'Canola'
	insert into CropXPlantSelection (cropid, plantselectionid) values (@cropid, @plantselectionid)	
	
	select @cropid = cropid from crops where crop = 'Carrot'
	insert into CropXPlantSelection (cropid, plantselectionid) values (@cropid, @plantselectionid)	
	
	select @cropid = cropid from crops where crop = 'Citrus'
	insert into CropXPlantSelection (cropid, plantselectionid) values (@cropid, @plantselectionid)
	
	select @cropid = cropid from crops where crop = 'Cucumber'
	insert into CropXPlantSelection (cropid, plantselectionid) values (@cropid, @plantselectionid)
	
	select @cropid = cropid from crops where crop = 'Lettuce'
	insert into CropXPlantSelection (cropid, plantselectionid) values (@cropid, @plantselectionid)
	
	select @cropid = cropid from crops where crop = 'Melon'
	insert into CropXPlantSelection (cropid, plantselectionid) values (@cropid, @plantselectionid)
	
	select @cropid = cropid from crops where crop = 'Mimulus'
	insert into CropXPlantSelection (cropid, plantselectionid) values (@cropid, @plantselectionid)

	select @cropid = cropid from crops where crop = 'Petunia'
	insert into CropXPlantSelection (cropid, plantselectionid) values (@cropid, @plantselectionid)
	
	select @cropid = cropid from crops where crop = 'Potato'
	insert into CropXPlantSelection (cropid, plantselectionid) values (@cropid, @plantselectionid)
	
	select @cropid = cropid from crops where crop = 'Tobacco'
	insert into CropXPlantSelection (cropid, plantselectionid) values (@cropid, @plantselectionid)
	
	select @cropid = cropid from crops where crop = 'Tomato'
	insert into CropXPlantSelection (cropid, plantselectionid) values (@cropid, @plantselectionid)		
	
	select @cropid = cropid from crops where crop = 'Walnut'
	insert into CropXPlantSelection (cropid, plantselectionid) values (@cropid, @plantselectionid)		

insert into plantselections (plantselection, isactive) values ('glufosinate', 1)

	select @plantSelectionID = plantselectionid from plantselections where plantselection = 'glufosinate'
	
	select @cropid = cropid from crops where crop = 'Alfalfa'
	insert into CropXPlantSelection (cropid, plantselectionid) values (@cropid, @plantselectionid)
	
	select @cropid = cropid from crops where crop = 'Pepper'
	insert into CropXPlantSelection (cropid, plantselectionid) values (@cropid, @plantselectionid)
	
	select @cropid = cropid from crops where crop = 'Potato'
	insert into CropXPlantSelection (cropid, plantselectionid) values (@cropid, @plantselectionid)
	
	select @cropid = cropid from crops where crop = 'Tobacco'
	insert into CropXPlantSelection (cropid, plantselectionid) values (@cropid, @plantselectionid)
	
	select @cropid = cropid from crops where crop = 'Tomato'
	insert into CropXPlantSelection (cropid, plantselectionid) values (@cropid, @plantselectionid)
	
	select @cropid = cropid from crops where crop = 'Truncatula'
	insert into CropXPlantSelection (cropid, plantselectionid) values (@cropid, @plantselectionid)
	

insert into plantselections (plantselection, isactive) values ('hygromycin', 1)

	select @plantSelectionID = plantselectionid from plantselections where plantselection = 'hygromycin'
	
	select @cropid = cropid from crops where crop = 'Canola'
	insert into CropXPlantSelection (cropid, plantselectionid) values (@cropid, @plantselectionid)
	
	select @cropid = cropid from crops where crop = 'Grape'
	insert into CropXPlantSelection (cropid, plantselectionid) values (@cropid, @plantselectionid)
	
	select @cropid = cropid from crops where crop = 'Lettuce'
	insert into CropXPlantSelection (cropid, plantselectionid) values (@cropid, @plantselectionid)	

	select @cropid = cropid from crops where crop = 'Petunia'
	insert into CropXPlantSelection (cropid, plantselectionid) values (@cropid, @plantselectionid)	

	select @cropid = cropid from crops where crop = 'Rice'
	insert into CropXPlantSelection (cropid, plantselectionid) values (@cropid, @plantselectionid)	

	select @cropid = cropid from crops where crop = 'Tobacco'
	insert into CropXPlantSelection (cropid, plantselectionid) values (@cropid, @plantselectionid)
	
	select @cropid = cropid from crops where crop = 'Tomato'
	insert into CropXPlantSelection (cropid, plantselectionid) values (@cropid, @plantselectionid)
	
-- == Agrostrains == --
insert into agrostrains (agrostrain, isactive) values ('ABI', 1)
insert into agrostrains (agrostrain, isactive) values ('AGL0', 1)
insert into agrostrains (agrostrain, isactive) values ('AGL1', 1)
insert into agrostrains (agrostrain, isactive) values ('ASE', 1)
insert into agrostrains (agrostrain, isactive) values ('C58', 1)
insert into agrostrains (agrostrain, isactive) values ('C58C1', 1)
insert into agrostrains (agrostrain, isactive) values ('EHA101', 1)
insert into agrostrains (agrostrain, isactive) values ('EHA105', 1)
insert into agrostrains (agrostrain, isactive) values ('EHA105pch32', 1)
insert into agrostrains (agrostrain, isactive) values ('GV3019', 1)
insert into agrostrains (agrostrain, isactive) values ('GV3101', 1)
insert into agrostrains (agrostrain, isactive) values ('GV3101pMP90RK', 1)
insert into agrostrains (agrostrain, isactive) values ('GV2260', 1)
insert into agrostrains (agrostrain, isactive) values ('LBA4404', 1)
insert into agrostrains (agrostrain, isactive) values ('Other', 1)

-- == Membership == --
insert into aspnet_SchemaVersions (Feature, CompatibleSchemaVersion, IsCurrentVersion) values ('common', '1', 1)
insert into aspnet_SchemaVersions (Feature, CompatibleSchemaVersion, IsCurrentVersion) values ('health monitoring', '1', 1)
insert into aspnet_SchemaVersions (Feature, CompatibleSchemaVersion, IsCurrentVersion) values ('membership', '1', 1)
insert into aspnet_SchemaVersions (Feature, CompatibleSchemaVersion, IsCurrentVersion) values ('personalization', '1', 1)
insert into aspnet_SchemaVersions (Feature, CompatibleSchemaVersion, IsCurrentVersion) values ('profile', '1', 1)
insert into aspnet_SchemaVersions (Feature, CompatibleSchemaVersion, IsCurrentVersion) values ('role manager', '1', 1)

DECLARE @RC int
DECLARE @ApplicationName nvarchar(256)
DECLARE @ApplicationId uniqueidentifier

set @ApplicationName = 'PTF'

EXECUTE @RC = [PTF].[dbo].[aspnet_Applications_CreateApplication] 
   @ApplicationName
  ,@ApplicationId OUTPUT