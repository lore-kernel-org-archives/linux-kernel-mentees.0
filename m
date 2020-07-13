Return-Path: <SRS0=16qS=AY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E36B1C433E4
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Jul 2020 18:29:53 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8DAA206F5
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Jul 2020 18:29:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B8DAA206F5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 79AFB8962A;
	Mon, 13 Jul 2020 18:29:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id veQeGx54Oq-E; Mon, 13 Jul 2020 18:29:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 05AE3895F4;
	Mon, 13 Jul 2020 18:29:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E86A6C088E;
	Mon, 13 Jul 2020 18:29:52 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9B657C0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 18:29:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 7CDF9262BC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 18:29:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id auAWCwIzp1aW
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 18:29:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
 by silver.osuosl.org (Postfix) with ESMTPS id A73672535C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 18:29:48 +0000 (UTC)
Received: from mail-qv1-f44.google.com ([209.85.219.44]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1Ml72g-1kZZZ72fbY-00lQz5 for
 <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 13 Jul 2020 20:29:45
 +0200
Received: by mail-qv1-f44.google.com with SMTP id e3so6224630qvo.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 11:29:45 -0700 (PDT)
X-Gm-Message-State: AOAM531Prz8H/qFx/oAzm1U71l8DCxhFQOQGXvNzwFLW0K1UPCdUpXa4
 bb7/As73nU0ZpnW+Gy2VPtu61Tjw2YHZG+oYJvM=
X-Google-Smtp-Source: ABdhPJwfhnh/6z+B3GNkz2O7U2CT1SIj0CHjYLjBXDThJSFXF+6qowbSkHtAc8ui9FKSnAQealaXP5kFF1JbDar0pbQ=
X-Received: by 2002:a0c:f802:: with SMTP id r2mr733004qvn.197.1594664984224;
 Mon, 13 Jul 2020 11:29:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200713122247.10985-1-refactormyself@gmail.com>
 <20200713122247.10985-3-refactormyself@gmail.com>
 <70e57af0-6a8c-a893-67c9-0181af16ae2b@lwfinger.net>
 <78b52ad5-015f-4452-0cd0-dbb2c8597672@gmail.com>
In-Reply-To: <78b52ad5-015f-4452-0cd0-dbb2c8597672@gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 13 Jul 2020 20:29:27 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0Qfojg==hiAGx0BvS1zmOEy+1vchXzcudw4EQZ4YwU4A@mail.gmail.com>
Message-ID: <CAK8P3a0Qfojg==hiAGx0BvS1zmOEy+1vchXzcudw4EQZ4YwU4A@mail.gmail.com>
To: Saheed Bolarinwa <refactormyself@gmail.com>
X-Provags-ID: V03:K1:9sy8jdSeuhWyWPt4ah5qhLAAcb0UbaITQUUBIMD3K/lHuNWGjvv
 s3Z1m1w9x6pSc7k+O0G+rDYC/6KQk80Xz090t+gYcFn1DQGjw4Tfny5sc7sRLsxaPJpbVHP
 UyeJ8DRyY7xhF0L0c+6ZSG1qK58E7cpVRwObO5CnCtQq8qkgaW/IdmSQZMLU4hV9H95RO1t
 buU1bVzjoTpk76O2K6nYQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:HHS/GVY/P0M=:2QRz5LKTGONGStXC5TcdnF
 usnzHDVE+iuL8tSWqxJuITm38OuugLgC6hXv4OAO0XvXknnKtcwi99ZgyEojI+a4dBKZSgp+Q
 5bgszy7wPSFeqd6dcefIdz6cZ9plR3GZkNtmejkJpZacHA+4nJ7qbWW5VMtyiaxS7ZBQXlDpm
 N/hPGKF9kPoVjHRzirCwoz3l1IJS5w/PlVrINBA4tu3adAqTkuOpsM/NXVYchAqYNGMphToDx
 PtTxu4oTSpe0E4MQreoT+EthS+utMtNp4hKKJQXCAsm6V4XMqDavq7bT+SnGYo/DU+KlgZ3fU
 6N1HWNfwozpuhOPRffawtFttybd+G3k8vrWgY3uaNelhHN4fAUcHOIcZHfh4jc98hc4+Tsgie
 cjhpymebYe7+2DqifwtocfXP5h0UQyuA169KytY2OdBkTfM5iFupj6X9MGR9nI/Ixjd1G3AOH
 WqEF28oXd9hNyj3mw0REZAotZxzkFeBW/8+/teCIw9RA5uon7IPL0hSb0ZsxJCgSRfcrsZdFt
 ZGUcrrNSDGe8K9J8TZixS4Im9dQoVgrE4H/khBxBNPui7GSJ18QH33YLNzCUj8HIDzBMg7Fss
 9Z8n7OOFL2AvHtSverBZBOWaRx7qlR/t4LDeBCtd6SQqNbslvU3KRzinuaqFgGkprIxjDmqp1
 pBU5bHlDAHX9kdALS79ASTv9hp/j6lBS7aQLlIGCjgq5Ka9DWQx4zKCZMUZO6mSXiLnn+oy02
 5xegagB9WD9lLpv9dXkmNysAdbALHpn22FXfprxORHKNvdXZGZL8zPPIsvcHW7zN2vDpiyLQ2
 c04L26Rfyiso+rna+NAkLbNtgHWt3joHOjJjRCNaQDsnMALXLQREZBpi0i1kEcG2uDRHjSH
Cc: linux-pci <linux-pci@vger.kernel.org>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Bjorn Helgaas <helgaas@kernel.org>, Michael Buesch <m@bues.ch>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Larry Finger <Larry.Finger@lwfinger.net>
Subject: Re: [Linux-kernel-mentees] [RFC PATCH 02/35] ssb: Change
	PCIBIOS_SUCCESSFUL to 0
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

On Mon, Jul 13, 2020 at 8:13 PM Saheed Bolarinwa
<refactormyself@gmail.com> wrote:
> On 7/13/20 7:16 PM, Larry Finger wrote:
>
> > Why is your name inside quotes in your s-o-b?
> >
> To keep me company before I get to know my way within the kernel.
>
> I saw people with >2 names do it, so I did! Please let me know if it is odd.

It's required for a proper email header if you have a dor (.) in your cleartext
name, but it is not required in a Signed-off-by tag, though a number of people
still do it out of habit. I'm sure it's fine either way.

     Arnd
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
