From: skunberg.kelsey@gmail.com (Kelsey Skunberg)
Date: Mon, 15 Jul 2019 21:57:01 -0600
Subject: [Linux-kernel-mentees] [PATCH v2] PCI: Remove functions not
 called in include/linux/pci.h
In-Reply-To: <20190715233717.GA79424@google.com>
References: <20190715175658.29605-1-skunberg.kelsey@gmail.com>
	<20190715181312.31403-1-skunberg.kelsey@gmail.com>
	<alpine.DEB.2.21.1907152138120.2564@felia>
	<20190715233717.GA79424@google.com>
Message-ID: <20190716035701.GA57724@JATN>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190716035701.xgSVJem6uKn2MA5gUx9MxJfOlq6EJO_RJM2EsG3yHhg@z>

On Mon, Jul 15, 2019 at 06:37:17PM -0500, Bjorn Helgaas wrote:
> On Mon, Jul 15, 2019 at 09:42:47PM +0200, Lukas Bulwahn wrote:
> > On Mon, 15 Jul 2019, Kelsey Skunberg wrote:
> > 
> > > Remove the following uncalled functions from include/linux/pci.h:
> > > 
> > >         pci_block_cfg_access()
> > >         pci_block_cfg_access_in_atomic()
> > >         pci_unblock_cfg_access()
> > > 
> > > Functions were added in patch fb51ccbf217c "PCI: Rework config space
> > > blocking services", ...
> 
> > Also note that commits are referred to with this format:
> > 
> > commit <12-character sha prefix> ("<commit message>")
> 
> FWIW, I use this shell alias to generate these references:
> 
>   gsr is aliased to `git --no-pager show -s --abbrev-commit --abbrev=12 --pretty=format:"%h (\"%s\")%n"'
> 
>   $ gsr fb51ccb
>   fb51ccbf217c ("PCI: Rework config space blocking services")
> 
> Documentation/process/submitting-patches.rst mentions a 12-char (at
> least) SHA-1 but the e21d2170f36 example shows a *20*-char SHA-1,
> which seems excessive to me.
> 
> I personally skip the word "commit" because I figure it's pretty
> obvious what it is, but it's fine either way.
> 
> Bjorn

This is very useful! I definitely like the use of the alias. Thank you!

-Kelsey
