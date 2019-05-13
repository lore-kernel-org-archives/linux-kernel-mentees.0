From: gregkh at linuxfoundation.org (Greg KH)
Date: Mon, 13 May 2019 10:42:17 +0200
Subject: [Linux-kernel-mentees] [PATCH v2 2/8] Staging: kpc2000:
 kpc_dma: Resolve coding style errors reported by checkpatch.
In-Reply-To: <20190512234000.16555-2-bnvandana@gmail.com>
References: <20190510193833.1051-1-bnvandana@gmail.com>
	<20190512234000.16555-1-bnvandana@gmail.com>
	<20190512234000.16555-2-bnvandana@gmail.com>
Message-ID: <20190513084217.GA17959@kroah.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

On Mon, May 13, 2019 at 05:09:54AM +0530, Vandana BN wrote:
> This patch resolves below errors reported by checkpatch
> ERROR: "(foo*)" should be "(foo *)"
> ERROR: "foo * bar" should be "foo *bar"
> ERROR: "foo __init  bar" should be "foo __init bar"
> ERROR: "foo __exit  bar" should be "foo __exit bar"
> 
> Signed-off-by: Vandana BN <bnvandana at gmail.com>

Better...

But your subject lines are almost all the same, with some being
identical to others, yet you are doing different things in each of the
patch.

So please provide a better subject line saying, in a unique way, exactly
what you are doing here.

thanks,

greg k-h
