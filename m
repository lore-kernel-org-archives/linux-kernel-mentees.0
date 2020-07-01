Return-Path: <SRS0=WnLp=AM=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D040AC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  1 Jul 2020 16:47:17 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98AF72067D
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  1 Jul 2020 16:47:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hzE0Psmc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 98AF72067D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 719F98C10A;
	Wed,  1 Jul 2020 16:47:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8tP1if4R7mdB; Wed,  1 Jul 2020 16:47:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8D90C8C109;
	Wed,  1 Jul 2020 16:47:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7C584C0865;
	Wed,  1 Jul 2020 16:47:15 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0E151C0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Jul 2020 16:47:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id F0B228AAF5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Jul 2020 16:47:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lNfYoT+NL7oD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Jul 2020 16:47:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
 [209.85.166.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 4120B8A929
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Jul 2020 16:47:14 +0000 (UTC)
Received: by mail-il1-f195.google.com with SMTP id a6so4905104ilq.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 01 Jul 2020 09:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=cgXOYeOBav3lpCc6RnkxnTtxmQ18prKpm12TGEbwf+o=;
 b=hzE0PsmcjXmfaB3rUYvH7zJ6hDATURfLwN+3G+b5VACszlph4RLjh3fdr9km+bIy6W
 T+P/x8649noHlVIIyegFH72mxYYGAc/IAOLGfeVlWSfwxwIUvIm3SMXyx6g4wOlzyIgU
 pWRGx7S+jTL1gHJNAW2zwQ55R00XUnHqt6dgO6YProoBoS6rgTuSo+uAVr3D3eG+3Doh
 FPA1QRbHBGvyYDiPWWWC1BC+Q748dlZzVN2foYrSFETFTOQzwJBe4Ut3Xt5PA/QnKJ2s
 bwG8TVjIdibU3DJTeFiegHt5nhrepQbNCuqcvaDQSj/bknwnyMtGOewtkwtrbX6/xSl1
 sKfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=cgXOYeOBav3lpCc6RnkxnTtxmQ18prKpm12TGEbwf+o=;
 b=pbPT3dcS/z+RngSyJ1NWIGlxitBZvoqOkXjDxJ1Z92c/1BLu1CynzxSj6ShpmwVpS+
 LzgRGSrvVpUDKvcD6qQWfpUuNmpvmkOwwFqaD/9/3LyNihT0qc8TSTxf8ay0JbDUgn5H
 oaFf66Gqaf+3lWfH6nvqpf4FQBfPNIIwhiBSuBom2Qs+uzzVCFh2lE/SDfmU4Q3wGz11
 e/M4XeNnn8BKotyrc/WzGYXNSQd++fXRUnIyn8Lr3Fk7cXytt8w+9mQvcJwbIZ23/43N
 jYVjTPeYrxT+SOtt9mg00KcKW3Qse1BVQmNexnCRjLhE/wGN0XNzRWr3h2L6DSocMIcV
 jlmw==
X-Gm-Message-State: AOAM533WmcSc95rG2bbYL9ZFYFWnR3pcOfcnWrDbD8E9bWAqrz0R/HWQ
 F3uFw+QMEKCt+L1zn5ryfNu43QoZZKJGlN2vTqY=
X-Google-Smtp-Source: ABdhPJxQMuxh0yObmiT7znRD89rOc/Jnm1QPfqG6yx5gFLYz5iKQuXIQ8XqSVqRPYiFMJCAeJGIkuiVVAgkzhYE0vQ0=
X-Received: by 2002:a92:5ecf:: with SMTP id f76mr9021204ilg.6.1593622033598;
 Wed, 01 Jul 2020 09:47:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200701125938.639447-1-vaibhavgupta40@gmail.com>
 <20200701125938.639447-5-vaibhavgupta40@gmail.com>
 <20200701085805.4dac84fb@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20200701085805.4dac84fb@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
From: Vaibhav Gupta <vaibhav.varodek@gmail.com>
Date: Wed, 1 Jul 2020 22:15:35 +0530
Message-ID: <CAPBsFfBb5Z6xVpo3A-0M0BDqgWqLFaQWcT0j7S+Q2wz375BZ4g@mail.gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Ajit Khaparde <ajit.khaparde@broadcom.com>,
 Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 Denis Kirjanov <kda@linux-powerpc.org>, David Dillow <dave@thedillows.org>,
 Somnath Kotur <somnath.kotur@broadcom.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Arthur Kiyanovski <akiyano@amazon.com>,
 Zorik Machulsky <zorik@amazon.com>, Bjorn Helgaas <helgaas@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Guy Tzalik <gtzalik@amazon.com>, Satanand Burla <sburla@marvell.com>,
 Felix Manlunas <fmanlunas@marvell.com>,
 Sriharsha Basavapatna <sriharsha.basavapatna@broadcom.com>,
 netdev@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Ion Badulescu <ionut@badula.org>, Netanel Belgazal <netanel@amazon.com>,
 Jon Mason <jdmason@kudzu.us>, Saeed Bishara <saeedb@amazon.com>,
 Derek Chickles <dchickles@marvell.com>,
 "David S. Miller" <davem@davemloft.net>, Tariq Toukan <tariqt@mellanox.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v1 04/11] ena_netdev: use generic
	power management
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

T24gV2VkLCAxIEp1bCAyMDIwIGF0IDIxOjI4LCBKYWt1YiBLaWNpbnNraSA8a3ViYUBrZXJuZWwu
b3JnPiB3cm90ZToKPgo+IE9uIFdlZCwgIDEgSnVsIDIwMjAgMTg6Mjk6MzEgKzA1MzAgVmFpYmhh
diBHdXB0YSB3cm90ZToKPiA+IFdpdGggbGVnYWN5IFBNLCBkcml2ZXJzIHRoZW1zZWx2ZXMgd2Vy
ZSByZXNwb25zaWJsZSBmb3IgbWFuYWdpbmcgdGhlCj4gPiBkZXZpY2UncyBwb3dlciBzdGF0ZXMg
YW5kIHRha2VzIGNhcmUgb2YgcmVnaXN0ZXIgc3RhdGVzLgo+ID4KPiA+IEFmdGVyIHVwZ3JhZGlu
ZyB0byB0aGUgZ2VuZXJpYyBzdHJ1Y3R1cmUsIFBDSSBjb3JlIHdpbGwgdGFrZSBjYXJlIG9mCj4g
PiByZXF1aXJlZCB0YXNrcyBhbmQgZHJpdmVycyBzaG91bGQgZG8gb25seSBkZXZpY2Utc3BlY2lm
aWMgb3BlcmF0aW9ucy4KPiA+Cj4gPiBDb21waWxlLXRlc3RlZCBvbmx5Lgo+ID4KPiA+IFNpZ25l
ZC1vZmYtYnk6IFZhaWJoYXYgR3VwdGEgPHZhaWJoYXZndXB0YTQwQGdtYWlsLmNvbT4KPgo+IFRo
aXMgb25lIHByb2R1Y2VzIGEgd2FybmluZyBvbiBhIFc9MSBidWlsZDoKPgo+IGRyaXZlcnMvbmV0
L2V0aGVybmV0L2FtYXpvbi9lbmEvZW5hX25ldGRldi5jOjQ0NjQ6MjY6IHdhcm5pbmc6IOKAmGVu
YV9wbV9vcHPigJkgZGVmaW5lZCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWNvbnN0LXZhcmlhYmxl
PV0KPiAgIDQ0NjQgfCBzdGF0aWMgU0lNUExFX0RFVl9QTV9PUFMoZW5hX3BtX29wcywgZW5hX3N1
c3BlbmQsIGVuYV9yZXN1bWUpOwpJIGZvcmdvdCB0byBiaW5kIGl0IGluc2lkZSAic3RhdGljIHN0
cnVjdCBwY2lfZHJpdmVyIGVuYV9wY2lfZHJpdmVyIiA6CiAgICAgIC5kcml2ZXIucG0gPSAmZW5h
X3BtX29wcywKCkkgYW0gc2VuZGluZyB2MiBvZiB0aGlzIHBhcnRpY3VsYXIgcGF0Y2guCgotLVZh
aWJoYXYgR3VwdGEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgta2VybmVsLW1lbnRlZXMgbWFpbGluZyBsaXN0CkxpbnV4LWtlcm5lbC1tZW50ZWVz
QGxpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24u
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgta2VybmVsLW1lbnRlZXMK
