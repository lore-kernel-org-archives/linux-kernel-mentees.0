Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 419EBC04A6A
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 10 Aug 2023 14:35:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C10F84051A;
	Thu, 10 Aug 2023 14:35:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C10F84051A
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=WvKmnKdT
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0D2wrieloXhJ; Thu, 10 Aug 2023 14:35:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id B36B84023D;
	Thu, 10 Aug 2023 14:35:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B36B84023D
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8FE54C0072;
	Thu, 10 Aug 2023 14:35:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B9695C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Aug 2023 14:35:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9434183F35
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Aug 2023 14:35:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9434183F35
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=WvKmnKdT
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id so17kYu9ULVP
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Aug 2023 14:35:07 +0000 (UTC)
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [IPv6:2001:4860:4864:20::32])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F1D5E83F0B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Aug 2023 14:35:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F1D5E83F0B
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-1bbaa549c82so871676fac.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Aug 2023 07:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691678106; x=1692282906;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B2gV1030sZCbxiS6NMaJx8ViLVSVMgkSZNa15D6K3vI=;
 b=WvKmnKdTk7/vcpPkkquQKRnsM2nH+X7LcfB5W5JUec4VmYYP/79R/TlGfNw9UDw8iv
 g8gWOr48Fpd95EJOkiyJZWMnl2lAJH6lXxeYXpE5PAiJTaAdNDfJ1EKJP2xXYsAPPlWa
 zcJIpjJmJjZICDXmQH3twd5/kUR+UWW5PsbHTN9WkbjKjB3y0xNIAuYvGSatJtFf1/wz
 XKloZWdRDnM+CplcTo0EW5JyP/vQlcYL0Vd4hX/tuyTnCmHROO2YEH5WnULbwn5JnblI
 LX/xm57Tgu+A94keG6VVPxvUCWyLtQKAVLbBb8oVKwajV7dhgYhhVktmpBchiH9gcGxx
 mf3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691678106; x=1692282906;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B2gV1030sZCbxiS6NMaJx8ViLVSVMgkSZNa15D6K3vI=;
 b=XatZPt5At7g2YhKQfSTkRcY9T0Gheu7hl4a5p+sZxcTnfRVIPbeofe3tkZuewL0u/J
 nCEGESTHtf9ASRobXBJ2sM/r6isBiWTS5+JSnEQFwRX9MhajeQsbb7Hv+NTnzSWBya0D
 WjQ6BGMvUw+NupF+BaVL1ZzoX0NwobZQbNnZXcdMqwWZtHLmgwSnPGf3l5QhWILKyXpL
 548UuD4sISOttFpRT7y3/VfeO4sH88jJtRmj6CdrmfxMmWWW53W5g53EJAKbUr+Cj//5
 u8sgRhRNgHXY5sh1DnmIsNWm0NjMkYqcO33roA2Dsb8itfcR2aE2jhrI8rwYex1yNCjG
 ryow==
X-Gm-Message-State: AOJu0YwASfY5gOKHyNVKfJfegky+5SspUh2iAj3KX6P+wgutFacODZ+5
 nyIX9NeuqkeaJw6kcRy1MwAAAqxacrty62suhaI=
X-Google-Smtp-Source: AGHT+IEHA1a88InV115gvWZ6fTpuo8G8dJ0JE+QhlYWK9ofr3EsSSwBeJb9FbIglLDFxn9OhngPeBTahocUoDlfqpz0=
X-Received: by 2002:a05:6870:364e:b0:1c0:b4ec:c0fa with SMTP id
 v14-20020a056870364e00b001c0b4ecc0famr2865098oak.41.1691678106019; Thu, 10
 Aug 2023 07:35:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230810130600.25616-1-coolrrsh@gmail.com>
In-Reply-To: <20230810130600.25616-1-coolrrsh@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 10 Aug 2023 17:34:30 +0300
Message-ID: <CAHp75VeSLwR-EbkJYM131Fkj2C0Cr1OA80B1=H1jOnpHcvt=NA@mail.gmail.com>
Subject: Re: [PATCH v3] gpio: gpio-imx-scu: Use ARRAY_SIZE for array length
To: coolrrsh@gmail.com
Cc: andy@kernel.org, linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 brgl@bgdev.pl
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

T24gVGh1LCBBdWcgMTAsIDIwMjMgYXQgNDowNuKAr1BNIDxjb29scnJzaEBnbWFpbC5jb20+IHdy
b3RlOgo+Cj4gRnJvbTogUmFqZXNod2FyIFIgU2hpbmRlIDxjb29scnJzaEBnbWFpbC5jb20+Cj4K
PiBVc2Ugb2YgbWFjcm8gQVJSQVlfU0laRSB0byBjYWxjdWxhdGUgYXJyYXkgc2l6ZSBtaW5pbWl6
ZXMKPiB0aGUgcmVkdW5kYW50IGNvZGUgYW5kIGltcHJvdmVzIGNvZGUgcmV1c2FiaWxpdHkuCj4g
VGhpcyBmaXhlcyB3YXJuaW5ncyByZXBvcnRlZCBieSBDb2NjaW5lbGxlOgo+IGRyaXZlcnMvZ3Bp
by9ncGlvLWlteC1zY3UuYzoxMDY6MzItMzM6IFdBUk5JTkc6IFVzZSBBUlJBWV9TSVpFCgpZZXMg
YW5kIHRoaXMgbWFrZXMgY29kZSBtb3JlIHJvYnVzdCBhZ2FpbnN0IHR5cGUgY2hhbmdlcy4KUmV2
aWV3ZWQtYnk6IEFuZHkgU2hldmNoZW5rbyA8YW5keS5zaGV2Y2hlbmtvQGdtYWlsLmNvbT4KCi0t
IApXaXRoIEJlc3QgUmVnYXJkcywKQW5keSBTaGV2Y2hlbmtvCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWtlcm5lbC1tZW50ZWVzIG1haWxpbmcg
bGlzdApMaW51eC1rZXJuZWwtbWVudGVlc0BsaXN0cy5saW51eGZvdW5kYXRpb24ub3JnCmh0dHBz
Oi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWtlcm5l
bC1tZW50ZWVzCg==
