Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27011C001DC
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 26 Jul 2023 19:37:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C15BC41E60;
	Wed, 26 Jul 2023 19:37:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C15BC41E60
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=QJTlVT7E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pxp-xTQQpy09; Wed, 26 Jul 2023 19:37:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 30E5F41E5E;
	Wed, 26 Jul 2023 19:37:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 30E5F41E5E
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1C597C0072;
	Wed, 26 Jul 2023 19:37:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7F677C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 26 Jul 2023 19:37:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4CE208206B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 26 Jul 2023 19:37:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4CE208206B
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=QJTlVT7E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ojozwd5_OpyN
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 26 Jul 2023 19:37:43 +0000 (UTC)
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2172F83981
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 26 Jul 2023 19:37:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2172F83981
Received: by mail-io1-xd2e.google.com with SMTP id
 ca18e2360f4ac-78666f06691so6056739f.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 26 Jul 2023 12:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690400262; x=1691005062;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UrJGrxEAP7eaauI+6CZSMeVgAKxwElVpsCCTJPBsNHM=;
 b=QJTlVT7E2T8qVnUonw3PSbJX+A7B1q+SNrmp2MQcG658IuG+mfKth/n6N37x5Fu1UO
 2QrbRQQ14JsDrFIsTQ+8dqgUQlMWPY3dICBmvQa+5MdVoKAvLxFZ/kIBeesB/4NcLQTC
 uDr47XrhC7QMHEMAU60XQ/Q47j3qnx/qxrODJRnECyxDiqK2+YXBOSAhZlVNPlGbLPze
 Cq5S5xF9mombQhgOBkypogR0+QmwvxqsM+Y1whJUaaYw4YODfh6yGSb0tfnz6ZhrPlr+
 BkMM2quYhYBbmG8q3WnDpXNN3c+cm5vlDP9xUesvdDPQ0CKrGoPmbSMQ5fS7gVU2zwOb
 5/JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690400262; x=1691005062;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UrJGrxEAP7eaauI+6CZSMeVgAKxwElVpsCCTJPBsNHM=;
 b=XVkTTeVNU+reMsBYHZSFiUiXEZ76YHutkHE4r1RgAeJ6+X0xg3UM1QTgDh2QqWOkmM
 DD70XvH4ralwlqJAnpfKC27b0LPiRGnSQbwpFf4I38OOlxsf/wiSi2J/MW1nLnxa5bk+
 1LE6Rl6BwngZC9Y8p2/c6XSNpQvVj2tEf9LvZIlR5lDqqbdn3hPC9J80XwcquH+dDrSn
 kuVa1mccGGq5y6nwQFo3hAe3L+HQaBXk4bFJf7cISNMTkoXpuPes+wBy53Hexda81IeH
 wdVVJh+Ut/rMlShJDef9EqwdrE5upujAW7TRkrPsPyT6E/bL5u7UosgPIR9lfmTqFdB4
 CpaA==
X-Gm-Message-State: ABy/qLaw6EpYYr6pM0ZM0y26EVH/WOyuIrgcFysyjWfx6kPUslVIXa8p
 yo61S2zAhaG1b2rSwRSLbUo=
X-Google-Smtp-Source: APBJJlFbwmAk3lw1hX4Cmcj+s6vABmChQ0DLw/LFf37ey+U/gscJZxXYRBqheVGjgGmGxeAhAtM7pg==
X-Received: by 2002:a5d:84d8:0:b0:76c:56fb:3c59 with SMTP id
 z24-20020a5d84d8000000b0076c56fb3c59mr3288332ior.10.1690400261991; 
 Wed, 26 Jul 2023 12:37:41 -0700 (PDT)
Received: from ?IPV6:2601:282:800:7ed0:bd1d:fe8d:d220:8378?
 ([2601:282:800:7ed0:bd1d:fe8d:d220:8378])
 by smtp.googlemail.com with ESMTPSA id
 z21-20020a6b5c15000000b007836e9ff198sm4996858ioh.55.2023.07.26.12.37.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jul 2023 12:37:41 -0700 (PDT)
Message-ID: <179979e6-eb8a-0300-5445-999b9366250a@gmail.com>
Date: Wed, 26 Jul 2023 13:37:40 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH v3] drivers: net: prevent tun_get_user() to exceed xdp
 size limits
Content-Language: en-US
To: Jesper Dangaard Brouer <jbrouer@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Andrew Kanner <andrew.kanner@gmail.com>
References: <20230725155403.796-1-andrew.kanner@gmail.com>
 <CACGkMEt=Cd8J995+0k=6MT1Pj=Fk9E_r2eZREptLt2osj_H-hA@mail.gmail.com>
 <ab722ec1-ae45-af1f-b869-e7339402c852@redhat.com>
From: David Ahern <dsahern@gmail.com>
In-Reply-To: <ab722ec1-ae45-af1f-b869-e7339402c852@redhat.com>
Cc: syzbot+f817490f5bd20541b90a@syzkaller.appspotmail.com,
 netdev@vger.kernel.org, John Fastabend <john.fastabend@gmail.com>,
 linux-kernel@vger.kernel.org, edumazet@google.com, brouer@redhat.com,
 kuba@kernel.org, pabeni@redhat.com,
 linux-kernel-mentees@lists.linuxfoundation.org, davem@davemloft.net
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

T24gNy8yNi8yMyAzOjAyIEFNLCBKZXNwZXIgRGFuZ2FhcmQgQnJvdWVyIHdyb3RlOgo+IENjLiBK
b2huIGFuZCBBaGVybgo+IAo+IE9uIDI2LzA3LzIwMjMgMDQuMDksIEphc29uIFdhbmcgd3JvdGU6
Cj4+IE9uIFR1ZSwgSnVsIDI1LCAyMDIzIGF0IDExOjU04oCvUE0gQW5kcmV3IEthbm5lcgo+PiA8
YW5kcmV3Lmthbm5lckBnbWFpbC5jb20+IHdyb3RlOgo+Pj4KPj4+IFN5emthbGxlciByZXBvcnRl
ZCB0aGUgZm9sbG93aW5nIGlzc3VlOgo+Pj4gPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09Cj4+PiBUb28gQklHIHhkcC0+ZnJhbWVfc3ogPSAxMzEwNzIKPiAKPiBJcyB0aGlz
IGEgY29udGlndW91cyBwaHlzaWNhbCBtZW1vcnkgYWxsb2NhdGlvbj8KPiAKPiAxMzEwNzIgYnl0
ZXMgZXF1YWwgb3JkZXIgNSBwYWdlLgo+IAo+IExvb2tpbmcgYXQgdHVuLmMgY29kZSBJIGNhbm5v
dCBmaW5kIGEgY29kZSBwYXRoIHRoYXQgY291bGQgY3JlYXRlCj4gb3JkZXItNSBza2ItPmRhdGEs
IGJ1dCBvbmx5IFNLQiB3aXRoIG9yZGVyLTAgZnJhZ21lbnRzLsKgIEJ1dCBJIGd1ZXNzIGl0Cj4g
aXMgdGhlIG5ldGlmX3JlY2VpdmVfZ2VuZXJpY194ZHAoKSB3aGF0IHdpbGwgcmVhbGxvYyB0byBt
YWtlIHRoaXMgbGluZWFyCj4gKHZpYSBza2JfbGluZWFyaXplKCkpCgoKZ2V0X3R1bl91c2VyIGlz
IHBhc3NlZCBhbiBpb3ZfaXRlciB3aXRoIGEgc2luZ2xlIHNlZ21lbnQgb2YgNjUwMDcKdG90YWxf
bGVuLiBUaGUgYWxsb2Nfc2tiIHBhdGggaXMgaGl0IHdpdGggYW4gYWxpZ24gc2l6ZSBvZiBvbmx5
IDY0LiBUaGF0CmlzIGluc3VmZmljaWVudCBmb3IgWERQIHNvIHRoZSBuZXRpZl9yZWNlaXZlX2dl
bmVyaWNfeGRwIGhpdHMgdGhlCnBza2JfZXhwYW5kX2hlYWQgcGF0aC4gU29tZXRoaW5nIGlzIG9m
ZiBpbiB0aGUgbWF0aCBpbgpuZXRpZl9yZWNlaXZlX2dlbmVyaWNfeGRwIHJlc3VsdGluZyBpbiB0
aGUgc2tiIG1hcmtlcnMgYmVpbmcgb2ZmLiBUaGF0CmNhdXNlcyBicGZfcHJvZ19ydW5fZ2VuZXJp
Y194ZHAgdG8gY29tcHV0ZSB0aGUgd3JvbmcgZnJhbWVfc3ouCgoKPiAKPj4+IFdBUk5JTkc6IENQ
VTogMCBQSUQ6IDUwMjAgYXQgbmV0L2NvcmUvZmlsdGVyLmM6NDEyMQo+Pj4gwqDCoCBfX19fYnBm
X3hkcF9hZGp1c3RfdGFpbCBuZXQvY29yZS9maWx0ZXIuYzo0MTIxIFtpbmxpbmVdCj4+PiBXQVJO
SU5HOiBDUFU6IDAgUElEOiA1MDIwIGF0IG5ldC9jb3JlL2ZpbHRlci5jOjQxMjEKPj4+IMKgwqAg
YnBmX3hkcF9hZGp1c3RfdGFpbCsweDQ2Ni8weGExMCBuZXQvY29yZS9maWx0ZXIuYzo0MTAzCj4+
PiAuLi4KPj4+IENhbGwgVHJhY2U6Cj4+PiDCoCA8VEFTSz4KPj4+IMKgIGJwZl9wcm9nXzRhZGQ4
N2U1MzAxYTQxMDUrMHgxYS8weDFjCj4+PiDCoCBfX2JwZl9wcm9nX3J1biBpbmNsdWRlL2xpbnV4
L2ZpbHRlci5oOjYwMCBbaW5saW5lXQo+Pj4gwqAgYnBmX3Byb2dfcnVuX3hkcCBpbmNsdWRlL2xp
bnV4L2ZpbHRlci5oOjc3NSBbaW5saW5lXQo+Pj4gwqAgYnBmX3Byb2dfcnVuX2dlbmVyaWNfeGRw
KzB4NTdlLzB4MTFlMCBuZXQvY29yZS9kZXYuYzo0NzIxCj4+PiDCoCBuZXRpZl9yZWNlaXZlX2dl
bmVyaWNfeGRwIG5ldC9jb3JlL2Rldi5jOjQ4MDcgW2lubGluZV0KPj4+IMKgIGRvX3hkcF9nZW5l
cmljKzB4MzVjLzB4NzcwIG5ldC9jb3JlL2Rldi5jOjQ4NjYKPj4+IMKgIHR1bl9nZXRfdXNlcisw
eDIzNDAvMHgzY2EwIGRyaXZlcnMvbmV0L3R1bi5jOjE5MTkKPj4+IMKgIHR1bl9jaHJfd3JpdGVf
aXRlcisweGU4LzB4MjEwIGRyaXZlcnMvbmV0L3R1bi5jOjIwNDMKPj4+IMKgIGNhbGxfd3JpdGVf
aXRlciBpbmNsdWRlL2xpbnV4L2ZzLmg6MTg3MSBbaW5saW5lXQo+Pj4gwqAgbmV3X3N5bmNfd3Jp
dGUgZnMvcmVhZF93cml0ZS5jOjQ5MSBbaW5saW5lXQo+Pj4gwqAgdmZzX3dyaXRlKzB4NjUwLzB4
ZTQwIGZzL3JlYWRfd3JpdGUuYzo1ODQKPj4+IMKgIGtzeXNfd3JpdGUrMHgxMmYvMHgyNTAgZnMv
cmVhZF93cml0ZS5jOjYzNwo+Pj4gwqAgZG9fc3lzY2FsbF94NjQgYXJjaC94ODYvZW50cnkvY29t
bW9uLmM6NTAgW2lubGluZV0KPj4+IMKgIGRvX3N5c2NhbGxfNjQrMHgzOC8weGIwIGFyY2gveDg2
L2VudHJ5L2NvbW1vbi5jOjgwCj4+PiDCoCBlbnRyeV9TWVNDQUxMXzY0X2FmdGVyX2h3ZnJhbWUr
MHg2My8weGNkCj4+Pgo+Pj4geGRwLT5mcmFtZV9zeiA+IFBBR0VfU0laRSBjaGVjayB3YXMgaW50
cm9kdWNlZCBpbiBjb21taXQgYzg3NDFlMmJmZTg3Cj4+PiAoInhkcDogQWxsb3cgYnBmX3hkcF9h
ZGp1c3RfdGFpbCgpIHRvIGdyb3cgcGFja2V0IHNpemUiKS4gQnV0Cj4+PiB0dW5fZ2V0X3VzZXIo
KSBzdGlsbCBwcm92aWRlcyBhbiBleGVjdXRpb24gcGF0aCB3aXRoIGRvX3hkcF9nZW5lcmljKCkK
Pj4+IGFuZCBleGNlZWQgWERQIGxpbWl0cyBmb3IgcGFja2V0IHNpemUuCj4gCj4gSSBhZGRlZCB0
aGlzIGNoZWNrIGFuZCBtYXliZSBpdCBpcyB0b28gc3RyaWN0LiBYRFAgY2FuIHdvcmsgb24gaGln
aGVyCj4gb3JkZXIgcGFnZXMsIGFzIGxvbmcgYXMgdGhpcyBpcyBjb250aWd1b3VzIHBoeXNpY2Fs
IG1lbW9yeSAoZS5nLiBhCj4gcGFnZSkuwqAgQW5kCj4gCj4gQW4gb3JkZXIgNSBwYWdlICgxMzEw
NzIgYnl0ZXMpIHNlZW1zIGV4Y2Vzc2l2ZSwgYnV0IG1heWJlIFRVTiBoYXZlIGEKPiB1c2UtY2Fz
ZSBmb3IgaGF2aW5nIHN1Y2ggbGFyZ2UgcGFja2V0cz8gKFF1ZXN0aW9uIHRvIEFoZXJuPykKPiAK
PiBJJ20gY29uc2lkZXJpbmcgd2Ugc2hvdWxkIGNoYW5nZSB0aGUgc2l6ZS1saW1pdCB0byBvcmRl
ci0yICgxNjM4NCkgb3IKPiBvcmRlci0zICgzMjc2OCkuCj4gCj4gT3JkZXItMyBiZWNhdXNlIG5l
dHN0YWNrIGhhdmU6Cj4gwqAgI2RlZmluZSBTS0JfRlJBR19QQUdFX09SREVSIGdldF9vcmRlcigz
Mjc2OCkKPiAKPiBBbmQgb3JkZXItMiBiZWNhdXNlIG5ldHN0YWNrIGhhdmU6IFNLQl9NQVhfQUxM
T0MgKDE2S2lCKQo+IMKgLSBTZWUgZGlzY3Vzc2lvbiBpbiBjb21taXQgNjMwNmMxMTg5ZTc3ICgi
YnBmOiBSZW1vdmUgTVRVIGNoZWNrIGluCj4gX19icGZfc2tiX21heF9sZW4iKS4KPiDCoC0gaHR0
cHM6Ly9naXQua2VybmVsLm9yZy90b3J2YWxkcy9jLzYzMDZjMTE4OWU3Nwo+IAo+IAo+Pj4KPj4+
IFVzaW5nIHRoZSBzeXprYWxsZXIgcmVwcm8gd2l0aCByZWR1Y2VkIHBhY2tldCBzaXplIGl0IHdh
cyBhbHNvCj4+PiBkaXNjb3ZlcmVkIHRoYXQgWERQX1BBQ0tFVF9IRUFEUk9PTSBpcyBub3QgY2hl
Y2tlZCBpbgo+Pj4gdHVuX2Nhbl9idWlsZF9za2IoKSwgYWx0aG91Z2ggcGFkIG1heSBiZSBpbmNy
ZW1lbnRlZCBpbgo+Pj4gdHVuX2J1aWxkX3NrYigpLgo+Pj4KPj4+IElmIHdlIG1vdmUgdGhlIGxp
bWl0IGNoZWNrIGZyb20gdHVuX2Nhbl9idWlsZF9za2IoKSB0byB0dW5fYnVpbGRfc2tiKCkKPj4+
IHdlIHdpbGwgbWFrZSB4ZHAgdG8gYmUgdXNlZCBvbmx5IGluIHR1bl9idWlsZF9za2IoKSwgd2l0
aG91dCBmYWxsaW5nCj4+PiBpbiB0dW5fYWxsb2Nfc2tiKCksIGV0Yy4gQW5kIG1vcmVvdmVyIHdl
IHdpbGwgZHJvcCB0aGUgcGFja2V0IHdoaWNoCj4+PiBjYW4ndCBiZSBwcm9jZXNzZWQgaW4gdHVu
X2J1aWxkX3NrYigpLgo+IAo+IExvb2tpbmcgYXQgdHVuX2J1aWxkX3NrYigpIGlzIHVzZXMgdGhl
IHBhZ2VfZnJhZyBzeXN0ZW0sIGFuZCBjYW4gdGh1cwo+IGNyZWF0ZSB1cC10byBTS0JfRlJBR19Q
QUdFX09SREVSIChzaXplIDMyNzY4IC8gb3JkZXItMykuCj4gCj4+Pgo+Pj4gUmVwb3J0ZWQtYW5k
LXRlc3RlZC1ieToKPj4+IHN5emJvdCtmODE3NDkwZjViZDIwNTQxYjkwYUBzeXprYWxsZXIuYXBw
c3BvdG1haWwuY29tCj4+PiBDbG9zZXM6Cj4+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwv
MDAwMDAwMDAwMDAwNzc0YjkyMDVmMWQ4YTgwZEBnb29nbGUuY29tL1QvCj4+PiBMaW5rOgo+Pj4g
aHR0cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20vYnVnP2lkPTUzMzVjN2M2MmJmZmY4OWJiYjFj
OGYxNGNkYWJlYmU5MTkwOTA2MGYKPj4+IEZpeGVzOiA3ZGYxMzIxOWQ3NTcgKCJ0dW46IHJlc2Vy
dmUgZXh0cmEgaGVhZHJvb20gb25seSB3aGVuIFhEUCBpcyBzZXQiKQo+Pj4gU2lnbmVkLW9mZi1i
eTogQW5kcmV3IEthbm5lciA8YW5kcmV3Lmthbm5lckBnbWFpbC5jb20+Cj4+PiAtLS0KPj4+Cj4+
PiBOb3RlczoKPj4+IMKgwqDCoMKgIFYyIC0+IFYzOgo+Pj4gwqDCoMKgwqAgKiBhdHRhY2ggdGhl
IGZvcmdvdHRlbiBjaGFuZ2Vsb2cKPj4+IMKgwqDCoMKgIFYxIC0+IFYyOgo+Pj4gwqDCoMKgwqAg
KiBtZXJnZWQgMiBwYXRjaGVzIGluIDEsIGZpeGluZyBib3RoIGlzc3VlczogV0FSTl9PTl9PTkNF
IHdpdGgKPj4+IMKgwqDCoMKgwqDCoCBzeXprYWxsZXIgcmVwcm8gYW5kIG1pc3NpbmcgWERQX1BB
Q0tFVF9IRUFEUk9PTSBpbiBwYWQKPj4+IMKgwqDCoMKgICogY2hhbmdlZCB0aGUgdGl0bGUgYW5k
IGRlc2NyaXB0aW9uIG9mIHRoZSBleGVjdXRpb24gcGF0aCwKPj4+IHN1Z2dlc3RlZAo+Pj4gwqDC
oMKgwqDCoMKgIGJ5IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+Cj4+PiDCoMKgwqDC
oCAqIG1vdmUgdGhlIGxpbWl0IGNoZWNrIGZyb20gdHVuX2Nhbl9idWlsZF9za2IoKSB0bwo+Pj4g
dHVuX2J1aWxkX3NrYigpIHRvCj4+PiDCoMKgwqDCoMKgwqAgcmVtb3ZlIGR1cGxpY2F0aW9uIGFu
ZCBsb2NraW5nIGlzc3VlLCBhbmQgYWxzbyBkcm9wIHRoZSBwYWNrZXQgaW4KPj4+IMKgwqDCoMKg
wqDCoCBjYXNlIG9mIGEgZmFpbGVkIGNoZWNrIC0gbm90ZWQgYnkgSmFzb24gV2FuZwo+Pj4gPGph
c293YW5nQHJlZGhhdC5jb20+Cj4+Cj4+IEFja2VkLWJ5OiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0By
ZWRoYXQuY29tPgo+Pgo+PiBUaGFua3MKPj4KPj4+Cj4+PiDCoCBkcml2ZXJzL25ldC90dW4uYyB8
IDcgKysrLS0tLQo+Pj4gwqAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgNCBkZWxl
dGlvbnMoLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvdHVuLmMgYi9kcml2ZXJz
L25ldC90dW4uYwo+Pj4gaW5kZXggZDc1NDU2YWRjNjJhLi43YzJiMDVjZTA0MjEgMTAwNjQ0Cj4+
PiAtLS0gYS9kcml2ZXJzL25ldC90dW4uYwo+Pj4gKysrIGIvZHJpdmVycy9uZXQvdHVuLmMKPj4+
IEBAIC0xNTk0LDEwICsxNTk0LDYgQEAgc3RhdGljIGJvb2wgdHVuX2Nhbl9idWlsZF9za2Ioc3Ry
dWN0Cj4+PiB0dW5fc3RydWN0ICp0dW4sIHN0cnVjdCB0dW5fZmlsZSAqdGZpbGUsCj4+PiDCoMKg
wqDCoMKgwqDCoMKgIGlmICh6ZXJvY29weSkKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHJldHVybiBmYWxzZTsKPj4+Cj4+PiAtwqDCoMKgwqDCoMKgIGlmIChTS0JfREFUQV9B
TElHTihsZW4gKyBUVU5fUlhfUEFEKSArCj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqAgU0tCX0RB
VEFfQUxJR04oc2l6ZW9mKHN0cnVjdCBza2Jfc2hhcmVkX2luZm8pKSA+IFBBR0VfU0laRSkKPj4+
IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBmYWxzZTsKPj4+IC0KPj4+IMKg
wqDCoMKgwqDCoMKgwqAgcmV0dXJuIHRydWU7Cj4+PiDCoCB9Cj4+Pgo+Pj4gQEAgLTE2NzMsNiAr
MTY2OSw5IEBAIHN0YXRpYyBzdHJ1Y3Qgc2tfYnVmZiAqdHVuX2J1aWxkX3NrYihzdHJ1Y3QKPj4+
IHR1bl9zdHJ1Y3QgKnR1biwKPj4+IMKgwqDCoMKgwqDCoMKgwqAgYnVmbGVuICs9IFNLQl9EQVRB
X0FMSUdOKGxlbiArIHBhZCk7Cj4+PiDCoMKgwqDCoMKgwqDCoMKgIHJjdV9yZWFkX3VubG9jaygp
Owo+Pj4KPj4+ICvCoMKgwqDCoMKgwqAgaWYgKGJ1ZmxlbiA+IFBBR0VfU0laRSkKPj4+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBFUlJfUFRSKC1FRkFVTFQpOwo+IAo+IENv
bmNyZXRlbHkgSSdtIHNheWluZyBtYXliZSB1c2UgU0tCX0ZSQUdfUEFHRV9PUkRFUiAic2l6ZSIg
aGVyZT8KPiAKPiBlLmcuIGNyZWF0ZSBTS0JfRlJBR19QQUdFX1NJWkUgZGVmaW5lIGFzIGJlbG93
Lgo+IMKgaWYgKGJ1ZmxlbiA+IFNLQl9GUkFHX1BBR0VfU0laRSkKPiAKPiBkaWZmIC0tZ2l0IGEv
aW5jbHVkZS9uZXQvc29jay5oIGIvaW5jbHVkZS9uZXQvc29jay5oCj4gaW5kZXggNjU2ZWE4OWY2
MGZmLi40YzRiM2MyNTdiNTIgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9uZXQvc29jay5oCj4gKysr
IGIvaW5jbHVkZS9uZXQvc29jay5oCj4gQEAgLTI4ODYsNyArMjg4Niw4IEBAIGV4dGVybiBpbnQg
c3lzY3RsX29wdG1lbV9tYXg7Cj4gwqBleHRlcm4gX191MzIgc3lzY3RsX3dtZW1fZGVmYXVsdDsK
PiDCoGV4dGVybiBfX3UzMiBzeXNjdGxfcm1lbV9kZWZhdWx0Owo+IAo+IC0jZGVmaW5lIFNLQl9G
UkFHX1BBR0VfT1JERVLCoMKgwqAgZ2V0X29yZGVyKDMyNzY4KQo+ICsjZGVmaW5lIFNLQl9GUkFH
X1BBR0VfU0laRcKgwqDCoMKgIDMyNzY4Cj4gKyNkZWZpbmUgU0tCX0ZSQUdfUEFHRV9PUkRFUsKg
wqDCoCBnZXRfb3JkZXIoU0tCX0ZSQUdfUEFHRV9TSVpFKQo+IMKgREVDTEFSRV9TVEFUSUNfS0VZ
X0ZBTFNFKG5ldF9oaWdoX29yZGVyX2FsbG9jX2Rpc2FibGVfa2V5KTsKPiAKPj4+ICsKPj4+IMKg
wqDCoMKgwqDCoMKgwqAgYWxsb2NfZnJhZy0+b2Zmc2V0ID0gQUxJR04oKHU2NClhbGxvY19mcmFn
LT5vZmZzZXQsCj4+PiBTTVBfQ0FDSEVfQllURVMpOwo+Pj4gwqDCoMKgwqDCoMKgwqDCoCBpZiAo
dW5saWtlbHkoIXNrYl9wYWdlX2ZyYWdfcmVmaWxsKGJ1ZmxlbiwgYWxsb2NfZnJhZywKPj4+IEdG
UF9LRVJORUwpKSkKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBF
UlJfUFRSKC1FTk9NRU0pOwo+IAo+IC0tSmVzcGVyCj4gCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1rZXJuZWwtbWVudGVlcyBtYWlsaW5nIGxp
c3QKTGludXgta2VybmVsLW1lbnRlZXNAbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZwpodHRwczov
L2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1rZXJuZWwt
bWVudGVlcwo=
