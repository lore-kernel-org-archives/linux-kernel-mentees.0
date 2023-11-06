Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E346BC4332F
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  6 Nov 2023 21:37:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 87183420E4;
	Mon,  6 Nov 2023 21:37:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 87183420E4
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SsnKkUjt
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T0MIgzziZ-8n; Mon,  6 Nov 2023 21:37:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 74A0B4207F;
	Mon,  6 Nov 2023 21:37:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 74A0B4207F
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3E354C0071;
	Mon,  6 Nov 2023 21:37:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EF98FC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Nov 2023 21:37:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CB00E4207F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Nov 2023 21:37:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB00E4207F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gwhy-Cvx2Uby
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Nov 2023 21:37:27 +0000 (UTC)
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [IPv6:2001:4860:4864:20::32])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0D78B408E3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Nov 2023 21:37:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D78B408E3
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-1f04c5ed8d7so2922332fac.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 06 Nov 2023 13:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699306646; x=1699911446;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OphoK9q7a6dBe49RqxvB+ZhnnNOavYr9X32u348/Dmw=;
 b=SsnKkUjtgKblQEbKzmW8NMNhxwGm2AhFrEkFijgYd5/wmgAYrNLBMKNGy6Hh0VtDlX
 1Itcm6/OxIXoNQct1WFy9a5UucWDM0gWcHniixbDNhdFd5jYz2fmIBhNRtAclB/Qf5tr
 Abq/xleyxTLTDClAD0WWPhULzPepaBcRVDg5AwiiksRaSfu0VbdmnAiEtaX6sXtJaMZI
 88T4RHPMAc/PV/hSuXHB9M392oeQrGAX765gz7We3QXmZE2yMXC33cyKI93Ev/a88/Wa
 v0IFpR2uyQyJMQ2ktJAnY1YzZ3JIgCVNfwdpykMhnXuC6Rg6HGky9rUjcYbHjiGTQTSD
 blgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699306646; x=1699911446;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OphoK9q7a6dBe49RqxvB+ZhnnNOavYr9X32u348/Dmw=;
 b=vTJEfKazS5kfkG3i9OQ+aMN6/R+Di76jO+kbuJG6VwKFT+KrhVEUyGiwhmAIch8e/7
 wLK0FvALuykdoLmTr+h73EhxYXzTD2Hp3gxktu66JSaNUOfxEwfA47vZqWr3ytUJsrrc
 TpGtTifSwrvYFi9Q6yFcIm9u25Wra0WfzNlI0UU6rrn+do0OH0VJl/0gg9E8xGcLdapy
 jjIxj135iyFQ3sXNNg4Oc3akXJ0pjGntfroedFtM9InNbibVYTvtsqVKkOKt6NeZ+vUg
 THK9MsmaLuNWmYtece/wjFi1lLlwtRPo7RqtonNx2ISgd8wzk81rXG+XFdendnDy3Knh
 Cvng==
X-Gm-Message-State: AOJu0YwB7gEils8Escgr0wJjKcX86dXgcnOepN2yG0M5Ec0k9EYGbR3t
 arnD2EX7Y6XVS6s7rOEDDs8bgYv8m4Flm76pPQ8=
X-Google-Smtp-Source: AGHT+IEP1XqEthoQJtfpl0npA4ae93Dzz/ImFHkuNMcwaOYVT9bgazTQ4NPqNXzu0dmR/IWccQ3n4KaVPdI0Je829g8=
X-Received: by 2002:a05:6871:339e:b0:1e9:b0fa:de48 with SMTP id
 ng30-20020a056871339e00b001e9b0fade48mr1089412oac.47.1699306645891; Mon, 06
 Nov 2023 13:37:25 -0800 (PST)
MIME-Version: 1.0
References: <20231103155013.332367-1-singhabhinav9051571833@gmail.com>
 <CADnq5_OkWD3YmCKgXbtk=Gnba3AgAiAWp2z_nzHQvRfEOsdXVg@mail.gmail.com>
 <3b92b89b-ca72-4012-b4f2-0b19e4ba9153@gmail.com>
In-Reply-To: <3b92b89b-ca72-4012-b4f2-0b19e4ba9153@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 6 Nov 2023 16:37:14 -0500
Message-ID: <CADnq5_PXRN+PL4wp+sWOXs2L5nQiRmfrw4065R1TE4YKw-ZeUA@mail.gmail.com>
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

T24gTW9uLCBOb3YgNiwgMjAyMyBhdCA0OjIw4oCvUE0gQWJoaW5hdiBTaW5naAo8c2luZ2hhYmhp
bmF2OTA1MTU3MTgzM0BnbWFpbC5jb20+IHdyb3RlOgo+Cj4gT24gMTEvNy8yMyAwMDoyNSwgQWxl
eCBEZXVjaGVyIHdyb3RlOgo+ID4gQXBwbGllZC4gIFRoaXMgbWF0Y2hlcyB3aGF0IHdlIGFscmVh
ZHkgZG8gaW4gdGhlIG90aGVyIGNsZWFyIHN0YXRlIGhlYWRlcnMuCj4gPgo+ID4gQWxleAo+ID4K
PiA+IE9uIEZyaSwgTm92IDMsIDIwMjMgYXQgMTI6MDDigK9QTSBBYmhpbmF2IFNpbmdoCj4gPiA8
c2luZ2hhYmhpbmF2OTA1MTU3MTgzM0BnbWFpbC5jb20+IHdyb3RlOgo+ID4+Cj4gPj4gc3BhcnNl
IHN0YXRpYyBhbmFseXNpcyB0b29scyBnZW5lcmF0ZSBhIHdhcm5pbmcgd2l0aCB0aGlzIG1lc3Nh
Z2UKPiA+PiAiVXNpbmcgcGxhaW4gaW50ZWdlciBhcyBOVUxMIHBvaW50ZXIiLiBJbiB0aGlzIGNh
c2UgdGhpcyB3YXJuaW5nIGlzCj4gPj4gYmVpbmcgc2hvd24gYmVjYXVzZSB3ZSBhcmUgdHJ5aW5n
IHRvIGludGlhbGl6ZSBhIHBvaW50ZXIgdG8gTlVMTCB1c2luZwo+ID4+IGludGVnZXIgdmFsdWUg
MC4KPiA+Pgo+ID4+IFNpZ25lZC1vZmYtYnk6IEFiaGluYXYgU2luZ2ggPHNpbmdoYWJoaW5hdjkw
NTE1NzE4MzNAZ21haWwuY29tPgo+ID4+IC0tLQo+ID4+ICAgZHJpdmVycy9ncHUvZHJtL3JhZGVv
bi9jbGVhcnN0YXRlX2V2ZXJncmVlbi5oIHwgOCArKysrLS0tLQo+ID4+ICAgMSBmaWxlIGNoYW5n
ZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiA+Pgo+ID4+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2NsZWFyc3RhdGVfZXZlcmdyZWVuLmggYi9kcml2ZXJz
L2dwdS9kcm0vcmFkZW9uL2NsZWFyc3RhdGVfZXZlcmdyZWVuLmgKPiA+PiBpbmRleCA2M2ExZmZi
YjNjZWQuLjNiNjQ1NTU4ZjEzMyAxMDA2NDQKPiA+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmFk
ZW9uL2NsZWFyc3RhdGVfZXZlcmdyZWVuLmgKPiA+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcmFk
ZW9uL2NsZWFyc3RhdGVfZXZlcmdyZWVuLmgKPiA+PiBAQCAtMTA0OSw3ICsxMDQ5LDcgQEAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBjc19leHRlbnRfZGVmIFNFQ1RfQ09OVEVYVF9kZWZzW10gPQo+ID4+
ICAgICAgIHtTRUNUX0NPTlRFWFRfZGVmXzUsIDB4MDAwMGEyOWUsIDUgfSwKPiA+PiAgICAgICB7
U0VDVF9DT05URVhUX2RlZl82LCAweDAwMDBhMmE1LCA1NiB9LAo+ID4+ICAgICAgIHtTRUNUX0NP
TlRFWFRfZGVmXzcsIDB4MDAwMGEyZGUsIDI5MCB9LAo+ID4+IC0gICAgeyAwLCAwLCAwIH0KPiA+
PiArICAgIHsgTlVMTCwgMCwgMCB9Cj4gPj4gICB9Owo+ID4+ICAgc3RhdGljIGNvbnN0IHUzMiBT
RUNUX0NMRUFSX2RlZl8xW10gPQo+ID4+ICAgewo+ID4+IEBAIC0xMDYwLDcgKzEwNjAsNyBAQCBz
dGF0aWMgY29uc3QgdTMyIFNFQ1RfQ0xFQVJfZGVmXzFbXSA9Cj4gPj4gICBzdGF0aWMgY29uc3Qg
c3RydWN0IGNzX2V4dGVudF9kZWYgU0VDVF9DTEVBUl9kZWZzW10gPQo+ID4+ICAgewo+ID4+ICAg
ICAgIHtTRUNUX0NMRUFSX2RlZl8xLCAweDAwMDBmZmMwLCAzIH0sCj4gPj4gLSAgICB7IDAsIDAs
IDAgfQo+ID4+ICsgICAgeyBOVUxMLCAwLCAwIH0KPiA+PiAgIH07Cj4gPj4gICBzdGF0aWMgY29u
c3QgdTMyIFNFQ1RfQ1RSTENPTlNUX2RlZl8xW10gPQo+ID4+ICAgewo+ID4+IEBAIC0xMDcwLDEx
ICsxMDcwLDExIEBAIHN0YXRpYyBjb25zdCB1MzIgU0VDVF9DVFJMQ09OU1RfZGVmXzFbXSA9Cj4g
Pj4gICBzdGF0aWMgY29uc3Qgc3RydWN0IGNzX2V4dGVudF9kZWYgU0VDVF9DVFJMQ09OU1RfZGVm
c1tdID0KPiA+PiAgIHsKPiA+PiAgICAgICB7U0VDVF9DVFJMQ09OU1RfZGVmXzEsIDB4MDAwMGYz
ZmMsIDIgfSwKPiA+PiAtICAgIHsgMCwgMCwgMCB9Cj4gPj4gKyAgICB7IE5VTEwsIDAsIDAgfQo+
ID4+ICAgfTsKPiA+PiAgIHN0YXRpYyBjb25zdCBzdHJ1Y3QgY3Nfc2VjdGlvbl9kZWYgZXZlcmdy
ZWVuX2NzX2RhdGFbXSA9IHsKPiA+PiAgICAgICB7IFNFQ1RfQ09OVEVYVF9kZWZzLCBTRUNUX0NP
TlRFWFQgfSwKPiA+PiAgICAgICB7IFNFQ1RfQ0xFQVJfZGVmcywgU0VDVF9DTEVBUiB9LAo+ID4+
ICAgICAgIHsgU0VDVF9DVFJMQ09OU1RfZGVmcywgU0VDVF9DVFJMQ09OU1QgfSwKPiA+PiAtICAg
IHsgMCwgU0VDVF9OT05FIH0KPiA+PiArICAgIHsgTlVMTCwgU0VDVF9OT05FIH0KPiA+PiAgIH07
Cj4gPj4gLS0KPiA+PiAyLjM5LjIKPiA+Pgo+IEhpIEFsZXgsIHRoYW5rcyBmb3IgbG9va2luZyBp
bnRvIHRoaXMuIEJ5IGFwcGxpZWQgeW91IG1lYW4gdGhpcyBwYXRjaCBpcwo+IGFjY2VwdGVkIGFu
ZCBpdCBoYXMgYmVlbiBtZXJnZWQ/CgpZZXMuICBPbmNlIGl0IG1ha2VzIGl0IHRocm91Z2ggb3Vy
IENJIHN5c3RlbSwgaXQgd2lsbCBzaG93IHVwIGluIG15CmRybS1uZXh0IHRyZWUuCgpBbGV4Cl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWtlcm5l
bC1tZW50ZWVzIG1haWxpbmcgbGlzdApMaW51eC1rZXJuZWwtbWVudGVlc0BsaXN0cy5saW51eGZv
dW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LWtlcm5lbC1tZW50ZWVzCg==
