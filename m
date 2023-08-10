Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2080FC001DE
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 10 Aug 2023 09:54:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 978E160C2B;
	Thu, 10 Aug 2023 09:54:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 978E160C2B
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=pMxkK5Lh
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8Q-_ttMX-nSJ; Thu, 10 Aug 2023 09:54:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 9EACA60BB8;
	Thu, 10 Aug 2023 09:54:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9EACA60BB8
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 54FD2C0071;
	Thu, 10 Aug 2023 09:54:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 76595C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Aug 2023 09:54:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 46B7D418B0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Aug 2023 09:54:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46B7D418B0
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=pMxkK5Lh
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IBzkExIw8eoB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Aug 2023 09:54:44 +0000 (UTC)
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com
 [IPv6:2001:4860:4864:20::35])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E571B418A9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Aug 2023 09:54:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E571B418A9
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-1bb717ece50so598253fac.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Aug 2023 02:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691661283; x=1692266083;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s08cxhY4o0sFxBf1wApMpSdM13IK7EgbJLSajHZa8sU=;
 b=pMxkK5LhQ+eDirbFO29SE5NE8y6Ih5PfEZQac3XOWvGgguRy84cXDgW69Tq4hN8Wkr
 qH8ZW0c8Rha0l3fZ326HVZNOfLngbhbHEysMk7RRDJhhnitHb1G23h1+wKaQrLazVBLa
 J7Z4KXq8CP18S/5+XS2syMdTaYpcb5JOldI/jJVyJC9xSJJKRc973s6oxes1E8YkR3Mj
 M7LP6QkWPD8KGUoS30IsdkHL7f9luPL3kTeAulczfWVkcQZYJrYwRsqmMCVqPVW/HVw0
 9ukVxxGepAGA23opUWMUi1/gGT7eObUvDkh7kNF7oYu30mNiQrwhNl3OfOcpG2WkW8K0
 AayQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691661283; x=1692266083;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s08cxhY4o0sFxBf1wApMpSdM13IK7EgbJLSajHZa8sU=;
 b=LDODLtKkH3YcM4y3Q28EB6mvgXoTLQySnMME53k2mb5QyCUvvMPBrpYnGNZthaNSON
 4pMOAEhzyIz3kMrHYIF7HDuyaiW67K4X+wla8xJ8fR/YKEYCnMeeMjzdAC2VyJZA3Wxx
 CNbj+N5p2v/5bg/WMTu0IGzhKrYOWRdvNkAhVoOvybDKkWeuEwFfS9EBajtW0iFDra7g
 zZliwCRUA0MP9KEfNf8im3fYLH6UYW26cUn4iK7dtdCUcAln1UGqycbBqIiygV51x+gp
 Dls6Yc2Q9tr6CT2mYBDmKf2vkRayTRiBLfmXOCXzL6MifljHXc+Xcv0ndvhpGrPfB8wP
 cYgA==
X-Gm-Message-State: AOJu0YwET3rI8Zf3yxuFpv8jKefUoWWZuKdTjTUeu7fh3KoVI0Eh8wgK
 kUJ/DKIirwlgcgjRzxor6A8A7PWTn9lXcB16ORs=
X-Google-Smtp-Source: AGHT+IHIbbjsxhjFHIcfmxnAfTqkWerVa3+/mQbo7P203pwFWrgEfiYAB8PFCOMbGUpXBtlCoHH/ouL5Y/9RRTbZ82g=
X-Received: by 2002:a05:6870:524c:b0:1a6:cba1:7cce with SMTP id
 o12-20020a056870524c00b001a6cba17ccemr2749488oai.32.1691661282828; Thu, 10
 Aug 2023 02:54:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230809171245.92081-1-coolrrsh@gmail.com>
In-Reply-To: <20230809171245.92081-1-coolrrsh@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 10 Aug 2023 12:54:06 +0300
Message-ID: <CAHp75VekbfUrRrqnb+2UnG-r2SVFRGV94RGofmrfxAg-ii09FA@mail.gmail.com>
Subject: Re: [PATCH] gpio: gpio-imx-scu: Use ARRAY_SIZE for array length
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

T24gV2VkLCBBdWcgOSwgMjAyMyBhdCA4OjEy4oCvUE0gPGNvb2xycnNoQGdtYWlsLmNvbT4gd3Jv
dGU6Cj4KPiBGcm9tOiBSYWplc2h3YXIgUiBTaGluZGUgPGNvb2xycnNoQGdtYWlsLmNvbT4KPgo+
IFVzZSBvZiBtYWNybyBBUlJBWV9TSVpFIHRvIGNhbGN1bGF0ZSBhcnJheSBzaXplIG1pbmltaXpl
cwo+IHRoZSByZWR1bmRhbnQgY29kZSBhbmQgaW1wcm92ZXMgY29kZSByZXVzYWJpbGl0eS4KPiBU
aGlzIGZpeGVzIHdhcm5pbmdzIHJlcG9ydGVkIGJ5IENvY2NpbmVsbGU6Cj4gZHJpdmVycy9ncGlv
L2dwaW8taW14LXNjdS5jOjEwNjozMi0zMzogV0FSTklORzogVXNlIEFSUkFZX1NJWkUKCkNhbiB5
b3UgdGVzdCB5b3VyIGNoYW5nZXMsIHBsZWFzZT8KV2UgZG9uJ3Qgd2FudCBqdXN0IG1lY2hhbmlj
YWwgKHNjcmlwdGVkKSBjb252ZXJzaW9uIHdpdGggb2J2aW91c2x5Cndyb25nIHJlc3VsdHMuCgpO
QUsuCgotLSAKV2l0aCBCZXN0IFJlZ2FyZHMsCkFuZHkgU2hldmNoZW5rbwpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1rZXJuZWwtbWVudGVlcyBt
YWlsaW5nIGxpc3QKTGludXgta2VybmVsLW1lbnRlZXNAbGlzdHMubGludXhmb3VuZGF0aW9uLm9y
ZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1rZXJuZWwtbWVudGVlcwo=
