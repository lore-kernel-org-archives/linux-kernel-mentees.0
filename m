Return-Path: <SRS0=jt7Q=7C=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 221D0C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 20 May 2020 07:22:09 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCFA7205CB
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 20 May 2020 07:22:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tkLV7x9Q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DCFA7205CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B59BF8762A;
	Wed, 20 May 2020 07:22:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nD0sV926-pxf; Wed, 20 May 2020 07:22:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id A84F98761B;
	Wed, 20 May 2020 07:22:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8A0C0C07FF;
	Wed, 20 May 2020 07:22:07 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7F5C6C0176
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 May 2020 07:22:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 67CAD88091
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 May 2020 07:22:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dZdCDp3YK-za
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 May 2020 07:22:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 0AE2A88018
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 May 2020 07:22:05 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id i14so2565525qka.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 May 2020 00:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:message-id:in-reply-to:references:subject
 :mime-version:content-transfer-encoding:content-disposition;
 bh=xb21+pzxr3Bmc+f6qLF5vmibm9Z7LktEGEv/X1GH7YU=;
 b=tkLV7x9QQSZ1yO4CF5A+1TfeY8Y/9+0vBFl9+85fDG9QuDaEG8UshBBAyiWgjnQLhF
 Uu82DTzmdrUx7E1TPKUYqYCf5jYi6ZlAYBOdbPNDbi2WI19LVRA819+neLt7E8mfE5y6
 JPgyqeZiMRhBxwWyUn32tBSdwViLCRqqD0XoAOVZH+wzRptfKmgw+b7s5/n1eclfjvBd
 opi9zDvQsd7CeE3UmtZw/Xw6NUQ70C5B8iUgnbyAixo8hVDXy9i2+/sjTC3TgDYqnzQF
 kV2c5Vl7A9iIn+jk0lBbhaPtlow92Y5yI8HuFcZ5Gqfh8eN1nevNgvQIOiqMdAfe+IBY
 XNSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:message-id:in-reply-to
 :references:subject:mime-version:content-transfer-encoding
 :content-disposition;
 bh=xb21+pzxr3Bmc+f6qLF5vmibm9Z7LktEGEv/X1GH7YU=;
 b=iCYdew2guJN6uzpG/Yn0KubVgiHekxWdUMlQUmk4+hY4lvxITwg0kcpQcR3CHOo5bE
 o/sWaeoKZtG9irYvBGvIJkigcQE/5eVJha8gx+H5CZSQ5tKecR/5kFii2r2/4qnXh21g
 MMihCg2AMDZTG4Fj+tZp9HohZBasXsOACuUugAQl/j6IBTm6QAHEpQV0RtVRhbjjB60Y
 xGApKZnRnvMYM5+i//Qwp0Q5zj5dPDWw/V0weHbqSZbOxlaXRx0n2/p5m54MM7k0bamO
 I16XX6FDz92EO/2IIAoZZQdLcKHg0SlkFDp9/zckWLtpIzPmkczozxXlhsKbv7qgYIqZ
 9ppQ==
X-Gm-Message-State: AOAM531iYbPKrdW1CALs4+D3XpQbT0+IdWFhqHJxdv6lqZ9EWus6y1Ws
 8+oRyJ6daOEY0+JqkFsD+sE=
X-Google-Smtp-Source: ABdhPJwGKR7dSGZoB8unx9tx1LUpD/bN8rg5EBcGSd5EekHPKy0ul/7QXt7yVV7bcOw9cBmAXngsVA==
X-Received: by 2002:a37:a508:: with SMTP id o8mr3486973qke.390.1589959323977; 
 Wed, 20 May 2020 00:22:03 -0700 (PDT)
Received: from dwls-dell ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
 by smtp.gmail.com with ESMTPSA id t88sm1794914qtd.5.2020.05.20.00.22.01
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 20 May 2020 00:22:03 -0700 (PDT)
Date: Wed, 20 May 2020 04:22:00 -0300
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Message-ID: <222A87CA-F424-4B7D-ABDF-318BF1A6791F@getmailspring.com>
In-Reply-To: <20200519104834.3c4bf5d7@coco.lan>
References: <20200519104834.3c4bf5d7@coco.lan>
X-Mailer: Mailspring
MIME-Version: 1.0
Content-Disposition: inline
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
 "=?utf-8?Q?linux-kernel-mentees=40lists.linuxfoundation.org=22=22=22?="
 <linux-kernel-mentees@lists.linuxfoundation.org>
Subject: Re: [Linux-kernel-mentees] modprobing 'vidtv' doesn't really do
	anything
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

Hi Mauro,

> Actually, passing 0 is not the right thing there. The init code
> should either be using gcc style:
> 
> 	struct psi_write_args psi_args = {}  
> 

I did not know that! Now fixed by replacing " = {0}" with " = {}"

As I said, the probing functions are actually called, but now I am
running into other issues..

I have sent a new revision (v6), in which I have squashed your patch
plus a few changes to the bridge driver.

In vidtv_bridge.c:266, dvb_module_probe always returns NULL. That is
because i2c_client_has_driver(client) fails, because client->dev.driver
is NULL.

I suspect this line is to blame, but I am not sure..
>	i2c_adapter->dev.parent = &dvb->pdev->dev;


Also, when this happens, some error handling code will run starting at
vidtv_bridge.c:383, but that will not remove the modules (i.e. lsmod
will still list the bridge and the demod). Is this expected? Should I
call vidtv_bridge_exit manually?

Also, should I worry about this?

>BUG: KASAN: user-memory-access in >do_init_module+0x1d/0x330
>Read of size 8 at addr 000000008322fe90 by task >modprobe/1290

I did not call this directly and I don't see a way to trace it back to
my code just by looking at "do_init_module+0x1d/0x330"

Thanks

- Daniel
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
