Return-Path: <SRS0=nBaC=E6=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 787D4C2D0E4
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 24 Nov 2020 19:53:12 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8DB9206D4
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 24 Nov 2020 19:53:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="1yYpmRyq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E8DB9206D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6FBAA8737A;
	Tue, 24 Nov 2020 19:53:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZZQIZ8f+Xqkz; Tue, 24 Nov 2020 19:53:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6FA1B8736F;
	Tue, 24 Nov 2020 19:53:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5A346C163C;
	Tue, 24 Nov 2020 19:53:10 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A3C4EC0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 Nov 2020 19:53:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 832058731F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 Nov 2020 19:53:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Okt6vdFUfUHR
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 Nov 2020 19:53:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 0206F8730B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 Nov 2020 19:53:07 +0000 (UTC)
Received: from localhost (129.sub-72-107-112.myvzw.com [72.107.112.129])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 28F9C206D4;
 Tue, 24 Nov 2020 19:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606247587;
 bh=zE+2MmKDRI9sbrGlq7BkuT6Mkm+WrAFVxPD0rd7A6wU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=1yYpmRyq/UEAZAec4JEVeWrxcK3k4oEXBlVgKHW3hukB0gmcv5/OfqVAgY8jKeM9r
 Xpk7upd2rteVBwLSny6HTcY4FazU/l89Me9l6GEh5dPQUgQCfnkbrK9xPqwoglU2O7
 zj45MJgXq/FUUcQ15AYuEzjnBiAn6uR+wEbNK+P8=
Date: Tue, 24 Nov 2020 13:53:05 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Puranjay Mohan <puranjay12@gmail.com>
Message-ID: <20201124195305.GA584380@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201117191718.17885-1-puranjay12@gmail.com>
Cc: linux-pci@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] PCI: Change return type of
	pci_find_capability()
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Wed, Nov 18, 2020 at 12:47:18AM +0530, Puranjay Mohan wrote:
> PCI Capabilities are linked in a list that must appear in the first 256 bytes of config space.
> The Capabilities Pointer register at 0x34 contains the address of the first Capability in the list.
> Each Capability contains an 8 bit "Next Capability Pointer" that is set to 0x00 in the last item of the list.
> 
> Change the return type of pci_find_capability() from int to u8 to match the specification.

Nits: Be more specific in subject, e.g., "Return u8 from
pci_find_capability()".   Wrap commit log to fit in 78 columns.  Add
blank lines between paragraphs.  The 0x34 address is accurate but not
relevant to this patch.

> Signed-off-by: Puranjay Mohan <puranjay12@gmail.com>
> ---
>  drivers/pci/pci.c   | 4 ++--
>  include/linux/pci.h | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> index 6d4d5a2f923d..05ac8a493e6b 100644
> --- a/drivers/pci/pci.c
> +++ b/drivers/pci/pci.c
> @@ -477,9 +477,9 @@ static int __pci_bus_find_cap_start(struct pci_bus *bus,
>   *  %PCI_CAP_ID_PCIX         PCI-X
>   *  %PCI_CAP_ID_EXP          PCI Express
>   */
> -int pci_find_capability(struct pci_dev *dev, int cap)
> +u8 pci_find_capability(struct pci_dev *dev, int cap)
>  {
> -	int pos;
> +	u8 pos;
>  
>  	pos = __pci_bus_find_cap_start(dev->bus, dev->devfn, dev->hdr_type);

Also change the signatures of __pci_bus_find_cap_start(),
__pci_find_next_cap(), __pci_find_next_cap_ttl() to match.

>  	if (pos)
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index 22207a79762c..19a817702ea9 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -1063,7 +1063,7 @@ void pci_sort_breadthfirst(void);
>  
>  /* Generic PCI functions exported to card drivers */
>  
> -int pci_find_capability(struct pci_dev *dev, int cap);
> +u8 pci_find_capability(struct pci_dev *dev, int cap);
>  int pci_find_next_capability(struct pci_dev *dev, u8 pos, int cap);
>  int pci_find_ext_capability(struct pci_dev *dev, int cap);
>  int pci_find_next_ext_capability(struct pci_dev *dev, int pos, int cap);
> @@ -1719,7 +1719,7 @@ static inline int __pci_register_driver(struct pci_driver *drv,
>  static inline int pci_register_driver(struct pci_driver *drv)
>  { return 0; }
>  static inline void pci_unregister_driver(struct pci_driver *drv) { }
> -static inline int pci_find_capability(struct pci_dev *dev, int cap)
> +static inline u8 pci_find_capability(struct pci_dev *dev, int cap)
>  { return 0; }
>  static inline int pci_find_next_capability(struct pci_dev *dev, u8 post,
>  					   int cap)
> -- 
> 2.27.0
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
