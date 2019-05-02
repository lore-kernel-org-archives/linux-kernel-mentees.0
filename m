From: puranjay12@gmail.com (Puranjay Mohan)
Date: Thu, 2 May 2019 10:21:24 +0530
Subject: [Linux-kernel-mentees] Seeking information about LKMP Project -
 "Linux PCI - Remove driver-local definitions of standard PCI symbols"
In-Reply-To: <1e3ae604-1e71-b930-2d33-c84cdbf629ca@linuxfoundation.org>
References: <20190501210717.GA30464@arch>
	<1e3ae604-1e71-b930-2d33-c84cdbf629ca@linuxfoundation.org>
Message-ID: <20190502045124.GA3765@arch>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190502045124.oVhTDADmD9X0nHSEBenMxCDFCGs29ZqjneyxebTlVfo@z>

On Wed, May 01, 2019 at 03:21:00PM -0600, Shuah Khan wrote:
> On 5/1/19 3:07 PM, Puranjay Mohan wrote:
> > Hello,
> > I wanted to get a few things clarified in relation to the aforementioned project in the subject.
> > 
> > The description of the project states that some drivers define their own copies of PCI_COMMAND, PCI_STATUS, etc.
> > 
> > If we remove these definitions,
> > then for the driver to work it has to include "include/uapi/linux/pci_regs.h",
> > so should we also add the include statement in the driver source code or it is already included by some other way.
> > 
> > Kindly help me resolve this confusion as I am a beginner at this.
> > If the question sounds wrong or lame, please forgive me.
> > I want to work on this project as a part of the Linux kernel mentorship program.
> > 
> 
> off list:
> 
> Hi Puranjay,
> 
> Are you interested in working on a PCI project? These projects listed on the
> project page are the ones mentees will work on once they have been selected
> after the application process is complete.
> 
> I just want to make sure you aren't working on these projects yet. You have
> several required contributions to complete to complete the application
> process.
> 
> thanks,
> -- Shuah
>

Hi,
I know we are not supposed to work on these projects right now.
While reading through the projects page, I found this one interesting and
out of curiosity wanted to know how it will work.

Thanks,
