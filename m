Return-Path: <SRS0=uvNB=AZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 148CBC433E6
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 14 Jul 2020 08:10:11 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D625F21582
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 14 Jul 2020 08:10:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D625F21582
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ACULAB.COM
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id A8615887D3;
	Tue, 14 Jul 2020 08:10:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cUE8gmthdkhH; Tue, 14 Jul 2020 08:10:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2349D887B0;
	Tue, 14 Jul 2020 08:10:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0B6EBC0888;
	Tue, 14 Jul 2020 08:10:10 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 54643C0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 08:10:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 43B29887C0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 08:10:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S0OBwj8Sqy4z
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 08:10:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
 by whitealder.osuosl.org (Postfix) with ESMTPS id CDA91887C4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 08:10:05 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-47-quVXGfyEOkSmpSddwNFlhw-1; Tue, 14 Jul 2020 09:10:01 +0100
X-MC-Unique: quVXGfyEOkSmpSddwNFlhw-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Tue, 14 Jul 2020 09:10:01 +0100
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000; 
 Tue, 14 Jul 2020 09:10:01 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Saheed Olayemi Bolarinwa' <refactormyself@gmail.com>,
 "helgaas@kernel.org" <helgaas@kernel.org>
Thread-Topic: [PATCH 11/14 v3] PCI/PM: Check return value of
 pcie_capability_read_*()
Thread-Index: AQHWVwhf1JBBv8jM7kKvf2XRj4wYvqkGvVFg
Date: Tue, 14 Jul 2020 08:10:00 +0000
Message-ID: <80c7a253134b43289ba28a320ba99f9c@AcuMS.aculab.com>
References: <20200710212026.27136-1-refactormyself@gmail.com>
 <20200710212026.27136-12-refactormyself@gmail.com>
In-Reply-To: <20200710212026.27136-12-refactormyself@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Cc: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH 11/14 v3] PCI/PM: Check return
 value of pcie_capability_read_*()
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

> From: Saheed Olayemi Bolarinwa
> Sent: 10 July 2020 22:20
> To: helgaas@kernel.org
> From: Bolarinwa Olayemi Saheed <refactormyself@gmail.com>
> 
> On failure pcie_capability_read_dword() sets it's last parameter,
> val to 0.
> However, with Patch 14/14, it is possible that val is set to ~0 on
> failure. This would introduce a bug because (x & x) == (~0 & x).
> 
> This bug can be avoided if the return value of pcie_capability_read_dword
> is checked to confirm success.
> 
> Check the return value of pcie_capability_read_dword() to ensure success.
> 
> Suggested-by: Bjorn Helgaas <bjorn@helgaas.com>
> Signed-off-by: Bolarinwa Olayemi Saheed <refactormyself@gmail.com>
> ---
>  drivers/pci/pci.c | 52 ++++++++++++++++++++++++++++++-----------------
>  1 file changed, 33 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> index ce096272f52b..9f18ffbf7bd4 100644
> --- a/drivers/pci/pci.c
> +++ b/drivers/pci/pci.c
> @@ -3207,6 +3207,7 @@ void pci_configure_ari(struct pci_dev *dev)
>  {
>  	u32 cap;
>  	struct pci_dev *bridge;
> +	int ret;
> 
>  	if (pcie_ari_disabled || !pci_is_pcie(dev) || dev->devfn)
>  		return;
> @@ -3215,8 +3216,8 @@ void pci_configure_ari(struct pci_dev *dev)
>  	if (!bridge)
>  		return;
> 
> -	pcie_capability_read_dword(bridge, PCI_EXP_DEVCAP2, &cap);
> -	if (!(cap & PCI_EXP_DEVCAP2_ARI))
> +	ret = pcie_capability_read_dword(bridge, PCI_EXP_DEVCAP2, &cap);
> +	if (ret || !(cap & PCI_EXP_DEVCAP2_ARI))
>  		return;

Why not make the function result 64bit?
Then you can return ~0ull on failure and the capability value on success.
Gets rid of the horrid error + return value pair.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
