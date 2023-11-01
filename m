Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FB58C4167D
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  1 Nov 2023 04:22:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E624E6FB1D;
	Wed,  1 Nov 2023 04:22:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E624E6FB1D
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=a25uXvRu
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BU4YpHQwYEfo; Wed,  1 Nov 2023 04:22:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id C42336129B;
	Wed,  1 Nov 2023 04:22:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C42336129B
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9FC5CC0071;
	Wed,  1 Nov 2023 04:22:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6BA08C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Nov 2023 04:22:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 46B99846F4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Nov 2023 04:22:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 46B99846F4
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=a25uXvRu
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BqUwuH5lpi7n
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Nov 2023 04:21:59 +0000 (UTC)
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 84B18846F0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Nov 2023 04:21:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 84B18846F0
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-6b2018a11efso6531261b3a.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Oct 2023 21:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698812519; x=1699417319;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pZje7TQ/ZEluQMkAlttorTMy20pqANNs00Qqi1mxzH4=;
 b=a25uXvRucJ4FdVnLo0mKLvMfEdL4VHvRQirNf3PSSCJUsGP1DmgI6y702TQWXylxiQ
 cWsHFrtbFcvAgfRUl6Et/lB1sE1ci0gesrZ/if8OHzwzeOCGyRIlR7TD34JgPRqn6Jdn
 OuBT1U5CZMZulUCe7G4MrTE4evqpT5kzqXwCZnfLZYSAXAZUAKcuUlMjgABikVX4FRoH
 MSfqWgIauHYbDuDnE4yMyDSnjLJ5uSeZQLrhR0LldVVIMOVWQ5Q7/P+SYtyHvE1k7OSU
 GOUnQVFTjz95J6/z0at7a06Nr09RXT/5kKZd3v/Oz/q5fPPHSswBI/1wfbxNBPsRjvgk
 OMCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698812519; x=1699417319;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pZje7TQ/ZEluQMkAlttorTMy20pqANNs00Qqi1mxzH4=;
 b=j/zrcUJrJdvSkw5eLWXHTvdcDWhSCAutqbFTo8pIZgjw7DdCndWHQ85SkW0BPUPAyT
 ZapDYBMZFPkOi2wzC0QwMLe9LrShAYxIo3GFUTRUig7VH4GWzX6aHoX9Cn3R0pnQTLXl
 ul/ZGSFEB8vrgHiYJTdk3M4sqGBRiDpf5WZV5EflTeTUMwI9crwxi5o1781looW7Llvq
 ieOVL0WmKAksH94zfnwfhI0EdJVPvJBnQ4zpule2clmPjBUzrtwmWDjj/T3lruY+qZfl
 /uTiRtkD9mWKJBIIyAUmKPp5Z43t1nWjeCsmwocpxmQbU9yiWqwdYdmEjsGz8oi+3l/j
 3dyw==
X-Gm-Message-State: AOJu0YxnHs/k7yODDDXUBOiEHoaFV5ti4QMv+A7i0MEz54+07FT7hl1g
 snip52npPl0SyfSF8eLEGd0=
X-Google-Smtp-Source: AGHT+IFycs4ynpzgQCPJVIe0gKegH/PB1KIR2pxRM17SEbyyGsItILd2fM9wQxVYG4+KE+aVya45YQ==
X-Received: by 2002:a05:6a20:1587:b0:15d:b243:6131 with SMTP id
 h7-20020a056a20158700b0015db2436131mr18156809pzj.44.1698812518745; 
 Tue, 31 Oct 2023 21:21:58 -0700 (PDT)
Received: from ?IPV6:2401:4900:6274:7b8d:58b:47c1:d32d:b04a?
 ([2401:4900:6274:7b8d:58b:47c1:d32d:b04a])
 by smtp.gmail.com with ESMTPSA id
 m11-20020a1709026bcb00b001c5eb2c4d8csm354261plt.160.2023.10.31.21.21.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Oct 2023 21:21:58 -0700 (PDT)
Message-ID: <152d15c4-10bb-45fe-9b9c-b323535a921f@gmail.com>
Date: Wed, 1 Nov 2023 09:50:36 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] input: joystick: driver for Adafruit Seesaw Gamepad
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas@t-8ch.de>
References: <20231027051819.81333-1-anshulusr@gmail.com>
 <20231027051819.81333-2-anshulusr@gmail.com>
 <d1dd2142-546f-42b7-8966-ab75fd4f8817@t-8ch.de>
 <efea5ae2-7e41-4b78-a283-1f907be560b0@gmail.com>
 <9c9f6171-f879-46f5-81d2-6764257a49eb@t-8ch.de>
From: Anshul Dalal <anshulusr@gmail.com>
In-Reply-To: <9c9f6171-f879-46f5-81d2-6764257a49eb@t-8ch.de>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-input@vger.kernel.org, Jeff LaBundy <jeff@labundy.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
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

T24gMTAvMzEvMjMgMDc6NTMsIFRob21hcyBXZWnDn3NjaHVoIHdyb3RlOgo+IE9jdCAzMSwgMjAy
MyAwMzoxMDo1MCBBbnNodWwgRGFsYWwgPGFuc2h1bHVzckBnbWFpbC5jb20+Ogo+IAo+PiBIZWxs
byBUaG9tYXMsCj4+Cj4+IFRoYW5rcyBmb3IgdGhlIHJldmlldyEgVGhlIHJlcXVlc3RlZCBjaGFu
Z2VzIHdpbGwgYmUgYWRkcmVzc2VkIGluIHRoZQo+PiBuZXh0IHBhdGNoIHZlcnNpb24gdGhvdWdo
IEkgaGFkIGEgZmV3IGNvbW1lbnRzIGJlbG93Ogo+Pgo+PiBPbiAxMC8yNy8yMyAxMTo0NCwgVGhv
bWFzIFdlacOfc2NodWggd3JvdGU6Cj4+PiBIaSBBbnNodWwsCj4+Pgo+Pj4gdGhhbmtzIGZvciB0
aGUgcmV3b3JrcyEKPj4+Cj4+PiBTb21lIG1vcmUgY29tbWVudHMgaW5saW5lLgo+Pj4KPj4+IE9u
IDIwMjMtMTAtMjcgMTA6NDg6MTErMDUzMCwgQW5zaHVsIERhbGFsIHdyb3RlOgo+IAo+IFsuLl0K
PiAKPj4+PiArc3RydWN0IHNlZXNhd19idXR0b25fZGVzY3JpcHRpb24gewo+Pj4+ICvCoMKgIHVu
c2lnbmVkIGludCBjb2RlOwo+Pj4+ICvCoMKgIHVuc2lnbmVkIGludCBiaXQ7Cj4+Pj4gK307Cj4+
Pj4gKwo+Pj4+ICtzdGF0aWMgY29uc3Qgc3RydWN0IHNlZXNhd19idXR0b25fZGVzY3JpcHRpb24g
c2Vlc2F3X2J1dHRvbnNbXSA9IHsKPj4+PiArwqDCoCB7Cj4+Pj4gK8KgwqDCoMKgwqDCoCAuY29k
ZSA9IEJUTl9FQVNULAo+Pj4+ICvCoMKgwqDCoMKgwqAgLmJpdCA9IFNFRVNBV19CVVRUT05fQSwK
Pj4+PiArwqDCoCB9LAo+Pj4+ICvCoMKgIHsKPj4+PiArwqDCoMKgwqDCoMKgIC5jb2RlID0gQlRO
X1NPVVRILAo+Pj4+ICvCoMKgwqDCoMKgwqAgLmJpdCA9IFNFRVNBV19CVVRUT05fQiwKPj4+PiAr
wqDCoCB9LAo+Pj4+ICvCoMKgIHsKPj4+PiArwqDCoMKgwqDCoMKgIC5jb2RlID0gQlROX05PUlRI
LAo+Pj4+ICvCoMKgwqDCoMKgwqAgLmJpdCA9IFNFRVNBV19CVVRUT05fWCwKPj4+PiArwqDCoCB9
LAo+Pj4+ICvCoMKgIHsKPj4+PiArwqDCoMKgwqDCoMKgIC5jb2RlID0gQlROX1dFU1QsCj4+Pj4g
K8KgwqDCoMKgwqDCoCAuYml0ID0gU0VFU0FXX0JVVFRPTl9ZLAo+Pj4+ICvCoMKgIH0sCj4+Pj4g
K8KgwqAgewo+Pj4+ICvCoMKgwqDCoMKgwqAgLmNvZGUgPSBCVE5fU1RBUlQsCj4+Pj4gK8KgwqDC
oMKgwqDCoCAuYml0ID0gU0VFU0FXX0JVVFRPTl9TVEFSVCwKPj4+PiArwqDCoCB9LAo+Pj4+ICvC
oMKgIHsKPj4+PiArwqDCoMKgwqDCoMKgIC5jb2RlID0gQlROX1NFTEVDVCwKPj4+PiArwqDCoMKg
wqDCoMKgIC5iaXQgPSBTRUVTQVdfQlVUVE9OX1NFTEVDVCwKPj4+PiArwqDCoCB9LAo+Pj4+ICt9
Owo+Pj4KPj4+IFRoaXMgbG9va3MgdmVyeSBtdWNoIGxpa2UgYSBzcGFyc2Uga2V5bWFwIHdoaWNo
IGNhbiBiZSBpbXBsZW1lbnRlZCB3aXRoCj4+PiB0aGUgaGVscGVycyBmcm9tIDxsaW51eC9pbnB1
dC9zcGFyc2Uta2V5bWFwLmg+Lgo+Pj4KPj4KPj4gV2hlbiBnb2luZyB0aHJvdWdoIHRoZSBBUEkg
cHJvdmlkZWQgYnkgc3BhcnNlLWtleW1hcCwgSSBjb3VsZCBvbmx5IHNlZQo+PiB0aGUgdXNlIGZv
ciBzcGFyc2Vfa2V5bWFwX3JlcG9ydF9lbnRyeSBoZXJlLiBXaGljaCBsZWFkcyB0byB0aGUKPj4g
Zm9sbG93aW5nIHJlZmFjdG9yZWQgY29kZToKPj4KPj4gc3RhdGljIGNvbnN0IHN0cnVjdCBrZXlf
ZW50cnkgc2Vlc2F3X2J1dHRvbnNfbmV3W10gPSB7Cj4+IMKgwqDCoCB7S0VfS0VZLCBTRUVTQVdf
QlVUVE9OX0EsIHtCVE5fU09VVEh9fSwKPj4gwqDCoMKgIHtLRV9LRVksIFNFRVNBV19CVVRUT05f
Qiwge0JUTl9FQVNUfX0sCj4gCj4gTm8gYnJhY2VzIEkgdGhpbmsuCj4gCgpTaW5jZSB0aGUgbGFz
dCBmaWVsZCBpbiBrZXlfZW50cnkgaXMgYSB1bmlvbiwgdGhlIGJyYWNlcyBzZWVtIHRvIGJlCnJl
cXVpcmVkLgoKPj4gwqDCoMKgIC4uLgo+PiB9Owo+Pgo+PiBmb3IgKGkgPSAwOyBpIDwgQVJSQVlf
U0laRShzZWVzYXdfYnV0dG9uc19uZXcpOyBpKyspIHsKPj4gwqDCoMKgIHNwYXJzZV9rZXltYXBf
cmVwb3J0X2VudHJ5KGlucHV0LCAmc2Vlc2F3X2J1dHRvbnNfbmV3W2ldLAo+PiDCoMKgwqDCoMKg
wqDCoCBkYXRhLmJ1dHRvbl9zdGF0ZSAmIEJJVChzZWVzYXdfYnV0dG9uc19uZXdbaV0uY29kZSks
Cj4+IMKgwqDCoMKgwqDCoMKgIGZhbHNlKTsKPj4gfQo+Pgo+PiBJIGRvbid0IHRoaW5rIHRoaXMg
c2lnbmlmaWNhbnRseSBpbXByb3ZlcyB0aGUgY29kZSB1bmxlc3MgeW91IGhhZCBzb21lCj4+IG90
aGVyIHdheSB0byB1c2UgdGhlIEFQSSBpbiBtaW5kLgo+IAo+IEkgdGhvdWdodCBhYm91dCBzcGFy
c2Vfa2V5bWFwX3NldHVwKCkgYW5kIHNwYXJzZV9rZXltYXBfcmVwb3J0X2V2ZW50KCkuCj4gCj4g
SXQgZG9lcyBub3Qgc2lnbmlmaWNhbnRseSBjaGFuZ2UgdGhlIGNvZGUgYnV0IHdvdWxkIGJlIGEg
c3RhbmRhcmQgQVBJLgo+IAoKVGhhbmtzIGZvciBwb2ludGluZyBtZSBpbiB0aGUgcmlnaHQgZGly
ZWN0aW9uLCBkbyB5b3UgdGhpbmsgdGhlCmZvbGxvd2luZyBpbXBsZW1lbnRhdGlvbiBvZiB0aGUg
QVBJIGlzIGFjY2VwdGFibGUgZm9yIHRoZSBkcml2ZXIuIFNpbmNlCkkgY291bGRuJ3QgZmluZCBh
IGRyaXZlciBmb3IgYW55IHNpbWlsYXIgZGV2aWNlIHVzaW5nIHRoZSBBUEkgaW4gdGhpcwptYW5u
ZXIuCgppbnNpZGUgc2Vlc2F3X3Byb2JlKCk6CgplcnIgPSBzcGFyc2Vfa2V5bWFwX3NldHVwKHNl
ZXNhdy0+aW5wdXRfZGV2LCBzZWVzYXdfYnV0dG9uc19uZXcsIE5VTEwpOwppZiAoZXJyKSB7Cglk
ZXZfZXJyKCZjbGllbnQtPmRldiwKCQkiZmFpbGVkIHRvIHNldCB1cCBpbnB1dCBkZXZpY2Uga2V5
bWFwOiAlZFxuIiwgZXJyKTsKCXJldHVybiBlcnI7Cn0KCmluc2lkZSBzZWVzYXdfcG9sbCgpOgoK
Zm9yIChpID0gMDsgaSA8IEFSUkFZX1NJWkUoc2Vlc2F3X2J1dHRvbnNfbmV3KTsgaSsrKSB7Cglp
ZiAoIXNwYXJzZV9rZXltYXBfcmVwb3J0X2V2ZW50KAoJCWlucHV0LCBzZWVzYXdfYnV0dG9uc19u
ZXdbaV0uY29kZSwKCQlkYXRhLmJ1dHRvbl9zdGF0ZSAmIEJJVChzZWVzYXdfYnV0dG9uc19uZXdb
aV0uY29kZSksCgkJZmFsc2UpKSB7CgkJZGV2X2Vycl9yYXRlbGltaXRlZCgKCQkJJmlucHV0LT5k
ZXYsCgkJCSJmYWlsZWQgdG8gcmVwb3J0IGV2ZW50IGZvciBrZXljb2RlOiAlZCIsCgkJCXNlZXNh
d19idXR0b25zX25ld1tpXS5rZXljb2RlKTsKCQlyZXR1cm47Cgl9Cn0KCj4gVGhvbWFzCgpCZXN0
IHJlZ2FyZHMsCkFuc2h1bApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1rZXJuZWwtbWVudGVlcyBtYWlsaW5nIGxpc3QKTGludXgta2VybmVsLW1l
bnRlZXNAbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRh
dGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1rZXJuZWwtbWVudGVlcwo=
