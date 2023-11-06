Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2DF4C4332F
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  6 Nov 2023 21:20:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2090881425;
	Mon,  6 Nov 2023 21:20:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2090881425
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gZIIC1tf
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kUTidY-FSDcq; Mon,  6 Nov 2023 21:20:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 0633A813DA;
	Mon,  6 Nov 2023 21:20:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0633A813DA
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D36C5C0071;
	Mon,  6 Nov 2023 21:20:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ACE00C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Nov 2023 21:20:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7825F40103
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Nov 2023 21:20:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7825F40103
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=gZIIC1tf
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T_eLbVGX0GHQ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Nov 2023 21:20:08 +0000 (UTC)
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com
 [IPv6:2607:f8b0:4864:20::c2d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6FF3A401CC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Nov 2023 21:20:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6FF3A401CC
Received: by mail-oo1-xc2d.google.com with SMTP id
 006d021491bc7-582050ce2d8so819815eaf.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 06 Nov 2023 13:20:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699305607; x=1699910407;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1fyk105fO9nPx1K8RQh7z3r5ykWh5/CrtqeSXyVa34c=;
 b=gZIIC1tf/PVw7ETooAasWplLI0coXbzRX9KmSAq4wQ06lt3FGuPriZT29CTEw1hrEZ
 Pkhi2eAkYdzP7iPGRPk+Ab6saGbQN1tJ7nuABq6Jvj2VhiNjhIApKJbmarM8u0xobznQ
 yyiw0oN0/pW7dqXAvigoimA36mm8UJUNT4tmSU7NeCPnqE8mdjX/UAuwCuY/V0S+/kmq
 CTyPf7rc6hn/gjkEX9F73W8kvnGHLof47Ap5AatEUVVR6L9TxLBRY8H9W5sWGa0B3nET
 sTHxjEyDeCA9iZog0zBnWY/+XdUPZSAKcHHGTB6yygipJSzOgcxhZpHKqCLrKvuxhaFk
 47rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699305607; x=1699910407;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1fyk105fO9nPx1K8RQh7z3r5ykWh5/CrtqeSXyVa34c=;
 b=UIt9Uff0t5sfOBZJvBOncHWvilFAqQJgi+gkElBqZHBDHJKRx+awGsgMv92HR6KrdK
 75V5+qFcNUzdM2hndztTOBlEhqUi9r+V++rBGUP9u1isN5abNsx/7fR3o2Ciij7ltek/
 zBT3ofPivsYHTLirZSguNWpVo5HBXGI469KyUS0EGw3sJ46QhO9IbeGfJ46/ZfzXC8W0
 cA9Nx/JF33Wd9Hvw00bqneUyKDm42I2hgFtv3JPfubcuDr5MWizyq8P1GPFQub53ojDw
 ExLxq8M+zbsMvHS6Dv+xOX9uzOi5BA3XLDEX7a+MuerCLuaN49SlC3t47aaszkV0Pxe5
 vaFA==
X-Gm-Message-State: AOJu0YzvACSdC1byIAR6UhAl7LNV/V2fYks/OBBW5WhjyRtyqNPJ5Fuo
 C3fB5YDohfbsvvdpz4wYwCI=
X-Google-Smtp-Source: AGHT+IH4VDf8xNiyaOS4OHF/NY+0agil1P2kuT4qJkDyOIVe9taGaS0U+sjLOgwU7KXVIGo4aSi+fQ==
X-Received: by 2002:a05:6358:f201:b0:169:4a72:2b84 with SMTP id
 jj1-20020a056358f20100b001694a722b84mr41339730rwb.1.1699305607292; 
 Mon, 06 Nov 2023 13:20:07 -0800 (PST)
Received: from [192.168.0.152] ([103.75.161.210])
 by smtp.gmail.com with ESMTPSA id
 y188-20020a6364c5000000b005b92ba3938dsm190941pgb.77.2023.11.06.13.20.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Nov 2023 13:20:06 -0800 (PST)
Message-ID: <3b92b89b-ca72-4012-b4f2-0b19e4ba9153@gmail.com>
Date: Tue, 7 Nov 2023 02:49:56 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drivers: gpu: Fix warning using plain integer as NULL
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>
References: <20231103155013.332367-1-singhabhinav9051571833@gmail.com>
 <CADnq5_OkWD3YmCKgXbtk=Gnba3AgAiAWp2z_nzHQvRfEOsdXVg@mail.gmail.com>
From: Abhinav Singh <singhabhinav9051571833@gmail.com>
In-Reply-To: <CADnq5_OkWD3YmCKgXbtk=Gnba3AgAiAWp2z_nzHQvRfEOsdXVg@mail.gmail.com>
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

T24gMTEvNy8yMyAwMDoyNSwgQWxleCBEZXVjaGVyIHdyb3RlOgo+IEFwcGxpZWQuICBUaGlzIG1h
dGNoZXMgd2hhdCB3ZSBhbHJlYWR5IGRvIGluIHRoZSBvdGhlciBjbGVhciBzdGF0ZSBoZWFkZXJz
Lgo+IAo+IEFsZXgKPiAKPiBPbiBGcmksIE5vdiAzLCAyMDIzIGF0IDEyOjAw4oCvUE0gQWJoaW5h
diBTaW5naAo+IDxzaW5naGFiaGluYXY5MDUxNTcxODMzQGdtYWlsLmNvbT4gd3JvdGU6Cj4+Cj4+
IHNwYXJzZSBzdGF0aWMgYW5hbHlzaXMgdG9vbHMgZ2VuZXJhdGUgYSB3YXJuaW5nIHdpdGggdGhp
cyBtZXNzYWdlCj4+ICJVc2luZyBwbGFpbiBpbnRlZ2VyIGFzIE5VTEwgcG9pbnRlciIuIEluIHRo
aXMgY2FzZSB0aGlzIHdhcm5pbmcgaXMKPj4gYmVpbmcgc2hvd24gYmVjYXVzZSB3ZSBhcmUgdHJ5
aW5nIHRvIGludGlhbGl6ZSBhIHBvaW50ZXIgdG8gTlVMTCB1c2luZwo+PiBpbnRlZ2VyIHZhbHVl
IDAuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEFiaGluYXYgU2luZ2ggPHNpbmdoYWJoaW5hdjkwNTE1
NzE4MzNAZ21haWwuY29tPgo+PiAtLS0KPj4gICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2NsZWFy
c3RhdGVfZXZlcmdyZWVuLmggfCA4ICsrKystLS0tCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDQgaW5z
ZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9yYWRlb24vY2xlYXJzdGF0ZV9ldmVyZ3JlZW4uaCBiL2RyaXZlcnMvZ3B1L2RybS9yYWRl
b24vY2xlYXJzdGF0ZV9ldmVyZ3JlZW4uaAo+PiBpbmRleCA2M2ExZmZiYjNjZWQuLjNiNjQ1NTU4
ZjEzMyAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9jbGVhcnN0YXRlX2V2
ZXJncmVlbi5oCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vY2xlYXJzdGF0ZV9ldmVy
Z3JlZW4uaAo+PiBAQCAtMTA0OSw3ICsxMDQ5LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBjc19l
eHRlbnRfZGVmIFNFQ1RfQ09OVEVYVF9kZWZzW10gPQo+PiAgICAgICB7U0VDVF9DT05URVhUX2Rl
Zl81LCAweDAwMDBhMjllLCA1IH0sCj4+ICAgICAgIHtTRUNUX0NPTlRFWFRfZGVmXzYsIDB4MDAw
MGEyYTUsIDU2IH0sCj4+ICAgICAgIHtTRUNUX0NPTlRFWFRfZGVmXzcsIDB4MDAwMGEyZGUsIDI5
MCB9LAo+PiAtICAgIHsgMCwgMCwgMCB9Cj4+ICsgICAgeyBOVUxMLCAwLCAwIH0KPj4gICB9Owo+
PiAgIHN0YXRpYyBjb25zdCB1MzIgU0VDVF9DTEVBUl9kZWZfMVtdID0KPj4gICB7Cj4+IEBAIC0x
MDYwLDcgKzEwNjAsNyBAQCBzdGF0aWMgY29uc3QgdTMyIFNFQ1RfQ0xFQVJfZGVmXzFbXSA9Cj4+
ICAgc3RhdGljIGNvbnN0IHN0cnVjdCBjc19leHRlbnRfZGVmIFNFQ1RfQ0xFQVJfZGVmc1tdID0K
Pj4gICB7Cj4+ICAgICAgIHtTRUNUX0NMRUFSX2RlZl8xLCAweDAwMDBmZmMwLCAzIH0sCj4+IC0g
ICAgeyAwLCAwLCAwIH0KPj4gKyAgICB7IE5VTEwsIDAsIDAgfQo+PiAgIH07Cj4+ICAgc3RhdGlj
IGNvbnN0IHUzMiBTRUNUX0NUUkxDT05TVF9kZWZfMVtdID0KPj4gICB7Cj4+IEBAIC0xMDcwLDEx
ICsxMDcwLDExIEBAIHN0YXRpYyBjb25zdCB1MzIgU0VDVF9DVFJMQ09OU1RfZGVmXzFbXSA9Cj4+
ICAgc3RhdGljIGNvbnN0IHN0cnVjdCBjc19leHRlbnRfZGVmIFNFQ1RfQ1RSTENPTlNUX2RlZnNb
XSA9Cj4+ICAgewo+PiAgICAgICB7U0VDVF9DVFJMQ09OU1RfZGVmXzEsIDB4MDAwMGYzZmMsIDIg
fSwKPj4gLSAgICB7IDAsIDAsIDAgfQo+PiArICAgIHsgTlVMTCwgMCwgMCB9Cj4+ICAgfTsKPj4g
ICBzdGF0aWMgY29uc3Qgc3RydWN0IGNzX3NlY3Rpb25fZGVmIGV2ZXJncmVlbl9jc19kYXRhW10g
PSB7Cj4+ICAgICAgIHsgU0VDVF9DT05URVhUX2RlZnMsIFNFQ1RfQ09OVEVYVCB9LAo+PiAgICAg
ICB7IFNFQ1RfQ0xFQVJfZGVmcywgU0VDVF9DTEVBUiB9LAo+PiAgICAgICB7IFNFQ1RfQ1RSTENP
TlNUX2RlZnMsIFNFQ1RfQ1RSTENPTlNUIH0sCj4+IC0gICAgeyAwLCBTRUNUX05PTkUgfQo+PiAr
ICAgIHsgTlVMTCwgU0VDVF9OT05FIH0KPj4gICB9Owo+PiAtLQo+PiAyLjM5LjIKPj4KSGkgQWxl
eCwgdGhhbmtzIGZvciBsb29raW5nIGludG8gdGhpcy4gQnkgYXBwbGllZCB5b3UgbWVhbiB0aGlz
IHBhdGNoIGlzIAphY2NlcHRlZCBhbmQgaXQgaGFzIGJlZW4gbWVyZ2VkPwpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1rZXJuZWwtbWVudGVlcyBt
YWlsaW5nIGxpc3QKTGludXgta2VybmVsLW1lbnRlZXNAbGlzdHMubGludXhmb3VuZGF0aW9uLm9y
ZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1rZXJuZWwtbWVudGVlcwo=
