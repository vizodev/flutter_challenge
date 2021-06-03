Vizo Flutter Challenge
===================
This test is presented to flutter developers candidates to validate his skills.

----------

The challenge
-------------
Your goal is to create an app with two screens:
 1. Home
 2. Experts list

#### <i class="icon-file"></i> Screens
<table>
<tbody>
<tr><th>Home</th>
  <th>List</th>
</tr>
<tr>
<td><img src="https://raw.githubusercontent.com/vizodev/flutter_challenge/master/chalelnge_assets/screens/home.png" style="height:300px">
</td>
<td><img src="https://raw.githubusercontent.com/vizodev/flutter_challenge/master/chalelnge_assets/screens/list.PNG" style="height:300px">
</td>
</tr>
</tbody>
</table>

<table>
<tbody>
<tr><th>Loading</th>
  <th>Help</th>
</tr>
<tr>
<td><img src="https://raw.githubusercontent.com/vizodev/flutter_challenge/master/chalelnge_assets/screens/loading.PNG" style="height:300px">
</td>
<td><img src="https://raw.githubusercontent.com/vizodev/flutter_challenge/master/chalelnge_assets/screens/font_and_colors.PNG"style="height:300px">
</td>
</tr>
</tbody>
</table>


#### <i class="icon-folder-open"></i> Fetching data
To fetch data from the rest API, use the GET method to receive the data

How to use:

**Home**
> - URL https://raw.githubusercontent.com/vizodev/flutter_challenge/master/chalelnge_assets/api/home_specialists.json
> - Method: GET
> 
**Heart Specialists**
> - URL https://raw.githubusercontent.com/vizodev/flutter_challenge/master/chalelnge_assets/api/list_specialist_heart.json
> - Method: GET

**Dental Care Specialists**
> - URL https://raw.githubusercontent.com/vizodev/flutter_challenge/master/chalelnge_assets/api/list_specialist_dental_care.json
> - Method: GET

**Dermatology Specialists**
> - URL https://raw.githubusercontent.com/vizodev/flutter_challenge/master/chalelnge_assets/api/list_specialist_dermatology.json
> - Method: GET



Response Example
>  [{
        "name": "Paula Bartlett",
        "description": "Aenean non diam in mi consequat efficitur eget at enim. Duis vitae odio eget mauris consequat tempus. Duis non erat vitae quam feugiat interdum. Aenean sit amet molestie quam. Vivamus sed nunc vitae nulla egestas varius. Donec facilisis sodales orci quis tempus. Nullam auctor faucibus justo vel semper",
        "actions": {
            "chat": "https://vizo.dev/",
            "call": "(00) 91234-1234"
        }
    }]

#### <i class="icon-pencil"></i> Prerequisites

- The screens must be responsive
- Use Firebase Anonymous Authentication

#### <i class="icon-folder-open"></i> What we expect
- State management - (Bloc, Cubit, Provider, etc...)
- Error treatment

#### <i class="icon-hdd"></i> Plus
- Animations
- Offline work (caching)
- Unit tests


Submit
-------------
Create a Fork of this repository to make the challenge, and after finish, send a Pull Request so we can run the code