From: davem at davemloft.net (David Miller)
Date: Wed, 26 Jun 2019 13:07:29 -0700 (PDT)
Subject: [Linux-kernel-mentees] [PATCH 3/3] net: ethernet: atheros:
 atlx: Remove unused and private PCI definitions
In-Reply-To: <20190621163921.26188-4-puranjay12@gmail.com>
References: <20190621163921.26188-1-puranjay12@gmail.com>
	<20190621163921.26188-4-puranjay12@gmail.com>
Message-ID: <20190626.130729.2125111135503705774.davem@davemloft.net>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

From: Puranjay Mohan <puranjay12 at gmail.com>
Date: Fri, 21 Jun 2019 22:09:21 +0530

> Remove unused private PCI definitions from skfbi.h because generic PCI
> symbols are already included from pci_regs.h.
> 
> Signed-off-by: Puranjay Mohan <puranjay12 at gmail.com>

Please also handle the PCI register bit value define duplications as well,
as pointed out by Bjorn.

Thanks.
