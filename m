From: skhan@linuxfoundation.org (Shuah Khan)
Date: Fri, 21 Jun 2019 10:36:02 -0600
Subject: [Linux-kernel-mentees] [PATCH v3 0/3] net: fddi: skfp: Use PCI
 generic definitions instead of private duplicates
In-Reply-To: <20190621162024.53620dd9@alans-desktop>
References: <20190621094607.15011-1-puranjay12@gmail.com>
	<20190621162024.53620dd9@alans-desktop>
Message-ID: <5f04f52d-8911-4db9-4321-00334d357d54@linuxfoundation.org>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190621163602.c8IWXE9bXc9eJh8-znU3JLjnemRzrNuEGhlxo4O1RgI@z>

On 6/21/19 9:20 AM, Alan Cox wrote:
> On Fri, 21 Jun 2019 15:16:04 +0530
> Puranjay Mohan <puranjay12 at gmail.com> wrote:
> 
>> This patch series removes the private duplicates of PCI definitions in
>> favour of generic definitions defined in pci_regs.h.
> 
> Why bother ? It's an ancient obsolete card ?
> 
> Do you even have one to test ?
> 
>>
>> This driver only uses some of the generic PCI definitons,
>> which are included from pci_regs.h and thier private versions
>> are removed from skfbi.h with all other private defines.
>>
>> The skfbi.h defines PCI_REV_ID and other private defines with different
>> names, these are renamed to Generic PCI names to make them
>> compatible with defines in pci_regs.h.
>>
>> All unused defines are removed from skfbi.h.
> 
> I sincerely doubt anyone on the planet is using this card any more.
> 
> Alan
> 

Thanks Alan!

Stephen Hemminger is suggesting removal as well. Makes sense to me.

David!

What would you recommend the next steps are? Would like driver removed?

thanks,
-- Shuah
