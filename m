From: davem@davemloft.net (David Miller)
Date: Wed, 26 Jun 2019 13:05:58 -0700 (PDT)
Subject: [Linux-kernel-mentees] [PATCH v5 0/3] net: fddi: skfp: Use PCI
 generic definitions instead of private duplicates
In-Reply-To: <20190621154037.25245-1-puranjay12@gmail.com>
References: <20190621154037.25245-1-puranjay12@gmail.com>
Message-ID: <20190626.130558.961377889679553755.davem@davemloft.net>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190626200558.3oYs5r9B5pN2pdVHrIOoi03X57HlZmY7mUV7g4l1EM8@z>

From: Puranjay Mohan <puranjay12@gmail.com>
Date: Fri, 21 Jun 2019 21:10:34 +0530

> This patch series removes the private duplicates of PCI definitions in
> favour of generic definitions defined in pci_regs.h.
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
 ...

Series applied, thanks.
