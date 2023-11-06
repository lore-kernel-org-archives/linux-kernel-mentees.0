Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53287C4167B
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  6 Nov 2023 18:55:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D50A881FB3;
	Mon,  6 Nov 2023 18:55:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D50A881FB3
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=RIa0++tJ
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h-Lnb0QBQ6xg; Mon,  6 Nov 2023 18:55:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id DC7C481F77;
	Mon,  6 Nov 2023 18:55:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC7C481F77
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B69CBC0039;
	Mon,  6 Nov 2023 18:55:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F3C2EC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Nov 2023 18:55:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BC45A6121A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Nov 2023 18:55:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC45A6121A
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=RIa0++tJ
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EJBVIzt8xbUD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Nov 2023 18:55:48 +0000 (UTC)
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1DB4A61164
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Nov 2023 18:55:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1DB4A61164
Received: by mail-ot1-x331.google.com with SMTP id
 46e09a7af769-6ce2fc858feso2531437a34.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 06 Nov 2023 10:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699296947; x=1699901747;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zlsdHfJoSxj4C6+EWFlQXpykD0ggHxFHCNPoza6FO40=;
 b=RIa0++tJQz6Dcll2N2jKTn8XupzDkOzxQTJn9DqRVPI8NSntnM/faf4yIxOaFKnwH6
 G1tUisYf4+shf/JQTFhrlldioagAXsDwVmhpDx4dGYZ2qvZy1wWpeiXcAOyKDxRHBmFG
 RVwK4/GZGQ+LpUIanSLXfu4RYYBxgstXWTELerGZXKa8nI10FTzj64ZSO6fnH1YquNeY
 +4/BFzCf14cazsygBvn0dlL3bhd1nwPO0FOUv4Aq8foR9DpJnkSCctHEEvH1tWIM9uIB
 yruNt06LxxUy1Qvari0wIa+yfg9RlQ0VgzZZ87S6Ta4sMezh6/cDUKp76m4wH8VmSaZ6
 b0kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699296947; x=1699901747;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zlsdHfJoSxj4C6+EWFlQXpykD0ggHxFHCNPoza6FO40=;
 b=L8bzuwtD+XlIFJW51v5wnXZKg+W6AwpJLa3uooZMZQT8UKvs1bGl2FUybrm5vyNbQI
 GQYpqWHqsor4NZz/FDZDFrpuo2U2/68ZF6OzJCDqlAwDYrQrp5S5V6bwnW3LQv2RJzgW
 X8LZJ/5gOMZ4ZNgdw1oLfxNsEwv88U62dUfLw+pSsu+3RHvLLxA4h1Juk7YTylpklgo/
 q44w4E5Z8Wcg6+cpg3zl+P9Prs6ctyoxOhbkZ7gkmsCuq7RtIetN9OmeECKQA6tszB1t
 vA9aCPReEJQ2XJdDD+pMte9uFu5ddAkDiY1rIOLUfG/oOdD7KEUNivEkSnPN6opNUX4l
 vvyA==
X-Gm-Message-State: AOJu0YzUXkcxm+4Q9UFXRZ1tBZ6SY1lFtNlcpR5E/Xg1fzl2PQQ+KXMy
 B3gDs3J9MEKq6j2HjQwxTXGmtM3IVgqcOwvgJAA=
X-Google-Smtp-Source: AGHT+IEkR6x1Zh0ykYQTzXTD4aBkfgt5NssWzvOEVxyh8znMkwhiQwaf9MnzYBKcCskVrhA5ssog/3XBzYOv9A5C9pw=
X-Received: by 2002:a05:6871:a002:b0:1e9:8885:b537 with SMTP id
 vp2-20020a056871a00200b001e98885b537mr555442oab.41.1699296947029; Mon, 06 Nov
 2023 10:55:47 -0800 (PST)
MIME-Version: 1.0
References: <20231103155013.332367-1-singhabhinav9051571833@gmail.com>
In-Reply-To: <20231103155013.332367-1-singhabhinav9051571833@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 6 Nov 2023 13:55:36 -0500
Message-ID: <CADnq5_OkWD3YmCKgXbtk=Gnba3AgAiAWp2z_nzHQvRfEOsdXVg@mail.gmail.com>
Subject: Re: [PATCH] drivers: gpu: Fix warning using plain integer as NULL
To: Abhinav Singh <singhabhinav9051571833@gmail.com>
Cc: airlied@gmail.com, Xinhui.Pan@amd.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 daniel@ffwll.ch, alexander.deucher@amd.com,
 linux-kernel-mentees@lists.linuxfoundation.org, christian.koenig@amd.com
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

QXBwbGllZC4gIFRoaXMgbWF0Y2hlcyB3aGF0IHdlIGFscmVhZHkgZG8gaW4gdGhlIG90aGVyIGNs
ZWFyIHN0YXRlIGhlYWRlcnMuCgpBbGV4CgpPbiBGcmksIE5vdiAzLCAyMDIzIGF0IDEyOjAw4oCv
UE0gQWJoaW5hdiBTaW5naAo8c2luZ2hhYmhpbmF2OTA1MTU3MTgzM0BnbWFpbC5jb20+IHdyb3Rl
Ogo+Cj4gc3BhcnNlIHN0YXRpYyBhbmFseXNpcyB0b29scyBnZW5lcmF0ZSBhIHdhcm5pbmcgd2l0
aCB0aGlzIG1lc3NhZ2UKPiAiVXNpbmcgcGxhaW4gaW50ZWdlciBhcyBOVUxMIHBvaW50ZXIiLiBJ
biB0aGlzIGNhc2UgdGhpcyB3YXJuaW5nIGlzCj4gYmVpbmcgc2hvd24gYmVjYXVzZSB3ZSBhcmUg
dHJ5aW5nIHRvIGludGlhbGl6ZSBhIHBvaW50ZXIgdG8gTlVMTCB1c2luZwo+IGludGVnZXIgdmFs
dWUgMC4KPgo+IFNpZ25lZC1vZmYtYnk6IEFiaGluYXYgU2luZ2ggPHNpbmdoYWJoaW5hdjkwNTE1
NzE4MzNAZ21haWwuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2NsZWFyc3Rh
dGVfZXZlcmdyZWVuLmggfCA4ICsrKystLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlv
bnMoKyksIDQgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Jh
ZGVvbi9jbGVhcnN0YXRlX2V2ZXJncmVlbi5oIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9jbGVh
cnN0YXRlX2V2ZXJncmVlbi5oCj4gaW5kZXggNjNhMWZmYmIzY2VkLi4zYjY0NTU1OGYxMzMgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9jbGVhcnN0YXRlX2V2ZXJncmVlbi5o
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9jbGVhcnN0YXRlX2V2ZXJncmVlbi5oCj4g
QEAgLTEwNDksNyArMTA0OSw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgY3NfZXh0ZW50X2RlZiBT
RUNUX0NPTlRFWFRfZGVmc1tdID0KPiAgICAgIHtTRUNUX0NPTlRFWFRfZGVmXzUsIDB4MDAwMGEy
OWUsIDUgfSwKPiAgICAgIHtTRUNUX0NPTlRFWFRfZGVmXzYsIDB4MDAwMGEyYTUsIDU2IH0sCj4g
ICAgICB7U0VDVF9DT05URVhUX2RlZl83LCAweDAwMDBhMmRlLCAyOTAgfSwKPiAtICAgIHsgMCwg
MCwgMCB9Cj4gKyAgICB7IE5VTEwsIDAsIDAgfQo+ICB9Owo+ICBzdGF0aWMgY29uc3QgdTMyIFNF
Q1RfQ0xFQVJfZGVmXzFbXSA9Cj4gIHsKPiBAQCAtMTA2MCw3ICsxMDYwLDcgQEAgc3RhdGljIGNv
bnN0IHUzMiBTRUNUX0NMRUFSX2RlZl8xW10gPQo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IGNzX2V4
dGVudF9kZWYgU0VDVF9DTEVBUl9kZWZzW10gPQo+ICB7Cj4gICAgICB7U0VDVF9DTEVBUl9kZWZf
MSwgMHgwMDAwZmZjMCwgMyB9LAo+IC0gICAgeyAwLCAwLCAwIH0KPiArICAgIHsgTlVMTCwgMCwg
MCB9Cj4gIH07Cj4gIHN0YXRpYyBjb25zdCB1MzIgU0VDVF9DVFJMQ09OU1RfZGVmXzFbXSA9Cj4g
IHsKPiBAQCAtMTA3MCwxMSArMTA3MCwxMSBAQCBzdGF0aWMgY29uc3QgdTMyIFNFQ1RfQ1RSTENP
TlNUX2RlZl8xW10gPQo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IGNzX2V4dGVudF9kZWYgU0VDVF9D
VFJMQ09OU1RfZGVmc1tdID0KPiAgewo+ICAgICAge1NFQ1RfQ1RSTENPTlNUX2RlZl8xLCAweDAw
MDBmM2ZjLCAyIH0sCj4gLSAgICB7IDAsIDAsIDAgfQo+ICsgICAgeyBOVUxMLCAwLCAwIH0KPiAg
fTsKPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBjc19zZWN0aW9uX2RlZiBldmVyZ3JlZW5fY3NfZGF0
YVtdID0gewo+ICAgICAgeyBTRUNUX0NPTlRFWFRfZGVmcywgU0VDVF9DT05URVhUIH0sCj4gICAg
ICB7IFNFQ1RfQ0xFQVJfZGVmcywgU0VDVF9DTEVBUiB9LAo+ICAgICAgeyBTRUNUX0NUUkxDT05T
VF9kZWZzLCBTRUNUX0NUUkxDT05TVCB9LAo+IC0gICAgeyAwLCBTRUNUX05PTkUgfQo+ICsgICAg
eyBOVUxMLCBTRUNUX05PTkUgfQo+ICB9Owo+IC0tCj4gMi4zOS4yCj4KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgta2VybmVsLW1lbnRlZXMgbWFp
bGluZyBsaXN0CkxpbnV4LWtlcm5lbC1tZW50ZWVzQGxpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcK
aHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
a2VybmVsLW1lbnRlZXMK
