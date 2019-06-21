From: gnomes at lxorguk.ukuu.org.uk (Alan Cox)
Date: Fri, 21 Jun 2019 16:20:24 +0100
Subject: [Linux-kernel-mentees] [PATCH v3 0/3] net: fddi: skfp: Use PCI
 generic definitions instead of private duplicates
In-Reply-To: <20190621094607.15011-1-puranjay12@gmail.com>
References: <20190621094607.15011-1-puranjay12@gmail.com>
Message-ID: <20190621162024.53620dd9@alans-desktop>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

On Fri, 21 Jun 2019 15:16:04 +0530
Puranjay Mohan <puranjay12 at gmail.com> wrote:

> This patch series removes the private duplicates of PCI definitions in
> favour of generic definitions defined in pci_regs.h.

Why bother ? It's an ancient obsolete card ?

Do you even have one to test ?

> 
> This driver only uses some of the generic PCI definitons,
> which are included from pci_regs.h and thier private versions
> are removed from skfbi.h with all other private defines.
> 
> The skfbi.h defines PCI_REV_ID and other private defines with different
> names, these are renamed to Generic PCI names to make them
> compatible with defines in pci_regs.h.
> 
> All unused defines are removed from skfbi.h.

I sincerely doubt anyone on the planet is using this card any more.

Alan
