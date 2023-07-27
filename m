Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5BEFC00528
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 27 Jul 2023 00:27:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 31C4040482;
	Thu, 27 Jul 2023 00:27:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 31C4040482
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=f3H4vfeL
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2N7ESpNUdlt8; Thu, 27 Jul 2023 00:27:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 481D6402F2;
	Thu, 27 Jul 2023 00:27:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 481D6402F2
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 01393C0071;
	Thu, 27 Jul 2023 00:27:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8D648C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Jul 2023 00:27:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6090941E57
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Jul 2023 00:27:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6090941E57
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=f3H4vfeL
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8IMmqgd1pGpN
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Jul 2023 00:27:15 +0000 (UTC)
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2AED741E44
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Jul 2023 00:27:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2AED741E44
Received: by mail-il1-x12b.google.com with SMTP id
 e9e14a558f8ab-348de515667so1268685ab.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 26 Jul 2023 17:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690417634; x=1691022434;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=i7g88EX3ElPzMHH1cxDZbT04edVSiNRVHvA7iXAYrAo=;
 b=f3H4vfeLylp2wg0nVMIywz+9PHn/KiSpcbldySF26DRn9AiUtEeBB5CkQJitGwEGKj
 5+mGkVG8SN4a05BWWSw67S9uT+IRrj9Rl+y/6sl3GTzp4tSHEzRFK66+RDz5xqhulEuz
 Hf4chdxIPAiC7+ba9o2axjXiPOoA8e8lb0YkWRMoQVMkWEPKfa6Jhgsb4b9ZF+wqTSgW
 HhN5FYEkXL2tkRrmctmcxQHBxrNJwZhneObt8vu7IqQhMzGa2Fix58MpS/CouPOcLmyo
 +LQV10zDWU4U49DYhoXS50330wNYor0r2MwB58UCJPg08YePkj/s/rdaRAZ0koKzL7zp
 5bzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690417634; x=1691022434;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=i7g88EX3ElPzMHH1cxDZbT04edVSiNRVHvA7iXAYrAo=;
 b=LSxMYDMXCBZk1zA6qZSTvCDezD3JU7JVOHaflS/g4rauAZo2tDBKRTL5CyMIr+nh7q
 z6Vd0UAGymzv0TNRopgdQkO9NtQ6bX+WRAoITpJU8xVB94FJU4zClEMtilbHFHjRpGTO
 RkHHIqofC50M5guZvjPstB+cbtR1kfF4BCdWnY1TQSoLGX1peavWY17PNvYhJWo2pCQv
 fGKO40HdBUfpTv4G+QaXX77x3Gr0Kjrb2EMs/GIy8q8SO1TYwsgXrEjBThI3YW6DE9p4
 IPvGPwlsKBWje+Ih3OjTrcYLSyauzFC50gWBW8ym3fKhO4r/uEuzuC4oMR3KnEvi9LzJ
 MRTQ==
X-Gm-Message-State: ABy/qLZdQRq0jC31zvWzjV3uBEq60qHA4IRSqyIxllnFz6bDQEg5z3pM
 uLgfmxxBzzxCcP2ehIsnOz0=
X-Google-Smtp-Source: APBJJlFpcp26uwvnPQ3z9ha61DL/89HUSRq9ynlxFUpBBUyir6DJ+iZRgQvQTbgbjaz1GmQ4xAxT8w==
X-Received: by 2002:a05:6e02:1a85:b0:346:63f1:a979 with SMTP id
 k5-20020a056e021a8500b0034663f1a979mr3892802ilv.30.1690417634018; 
 Wed, 26 Jul 2023 17:27:14 -0700 (PDT)
Received: from ?IPV6:2601:282:800:7ed0:bd1d:fe8d:d220:8378?
 ([2601:282:800:7ed0:bd1d:fe8d:d220:8378])
 by smtp.googlemail.com with ESMTPSA id
 y5-20020a92d805000000b0033b2a123254sm147546ilm.61.2023.07.26.17.27.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jul 2023 17:27:13 -0700 (PDT)
Message-ID: <0c06b067-349c-9fe2-2cc3-36c149fd5277@gmail.com>
Date: Wed, 26 Jul 2023 18:27:12 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH v3] drivers: net: prevent tun_get_user() to exceed xdp
 size limits
Content-Language: en-US
From: David Ahern <dsahern@gmail.com>
To: Jesper Dangaard Brouer <jbrouer@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Andrew Kanner <andrew.kanner@gmail.com>
References: <20230725155403.796-1-andrew.kanner@gmail.com>
 <CACGkMEt=Cd8J995+0k=6MT1Pj=Fk9E_r2eZREptLt2osj_H-hA@mail.gmail.com>
 <ab722ec1-ae45-af1f-b869-e7339402c852@redhat.com>
 <179979e6-eb8a-0300-5445-999b9366250a@gmail.com>
In-Reply-To: <179979e6-eb8a-0300-5445-999b9366250a@gmail.com>
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

T24gNy8yNi8yMyAxOjM3IFBNLCBEYXZpZCBBaGVybiB3cm90ZToKPiBPbiA3LzI2LzIzIDM6MDIg
QU0sIEplc3BlciBEYW5nYWFyZCBCcm91ZXIgd3JvdGU6Cj4+IENjLiBKb2huIGFuZCBBaGVybgo+
Pgo+PiBPbiAyNi8wNy8yMDIzIDA0LjA5LCBKYXNvbiBXYW5nIHdyb3RlOgo+Pj4gT24gVHVlLCBK
dWwgMjUsIDIwMjMgYXQgMTE6NTTigK9QTSBBbmRyZXcgS2FubmVyCj4+PiA8YW5kcmV3Lmthbm5l
ckBnbWFpbC5jb20+IHdyb3RlOgo+Pj4+Cj4+Pj4gU3l6a2FsbGVyIHJlcG9ydGVkIHRoZSBmb2xs
b3dpbmcgaXNzdWU6Cj4+Pj4gPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
Cj4+Pj4gVG9vIEJJRyB4ZHAtPmZyYW1lX3N6ID0gMTMxMDcyCj4+Cj4+IElzIHRoaXMgYSBjb250
aWd1b3VzIHBoeXNpY2FsIG1lbW9yeSBhbGxvY2F0aW9uPwo+Pgo+PiAxMzEwNzIgYnl0ZXMgZXF1
YWwgb3JkZXIgNSBwYWdlLgo+Pgo+PiBMb29raW5nIGF0IHR1bi5jIGNvZGUgSSBjYW5ub3QgZmlu
ZCBhIGNvZGUgcGF0aCB0aGF0IGNvdWxkIGNyZWF0ZQo+PiBvcmRlci01IHNrYi0+ZGF0YSwgYnV0
IG9ubHkgU0tCIHdpdGggb3JkZXItMCBmcmFnbWVudHMuwqAgQnV0IEkgZ3Vlc3MgaXQKPj4gaXMg
dGhlIG5ldGlmX3JlY2VpdmVfZ2VuZXJpY194ZHAoKSB3aGF0IHdpbGwgcmVhbGxvYyB0byBtYWtl
IHRoaXMgbGluZWFyCj4+ICh2aWEgc2tiX2xpbmVhcml6ZSgpKQo+IAo+IAo+IGdldF90dW5fdXNl
ciBpcyBwYXNzZWQgYW4gaW92X2l0ZXIgd2l0aCBhIHNpbmdsZSBzZWdtZW50IG9mIDY1MDA3Cj4g
dG90YWxfbGVuLiBUaGUgYWxsb2Nfc2tiIHBhdGggaXMgaGl0IHdpdGggYW4gYWxpZ24gc2l6ZSBv
ZiBvbmx5IDY0LiBUaGF0Cj4gaXMgaW5zdWZmaWNpZW50IGZvciBYRFAgc28gdGhlIG5ldGlmX3Jl
Y2VpdmVfZ2VuZXJpY194ZHAgaGl0cyB0aGUKPiBwc2tiX2V4cGFuZF9oZWFkIHBhdGguIFNvbWV0
aGluZyBpcyBvZmYgaW4gdGhlIG1hdGggaW4KPiBuZXRpZl9yZWNlaXZlX2dlbmVyaWNfeGRwIHJl
c3VsdGluZyBpbiB0aGUgc2tiIG1hcmtlcnMgYmVpbmcgb2ZmLiBUaGF0Cj4gY2F1c2VzIGJwZl9w
cm9nX3J1bl9nZW5lcmljX3hkcCB0byBjb21wdXRlIHRoZSB3cm9uZyBmcmFtZV9zei4KCgpCVFcs
IGl0IGlzIHBza2JfZXhwYW5kX2hlYWQgdGhhdCB0dXJucyBpdCBmcm9tIGEgNjRrQiB0byBhIDEy
OCBrQgphbGxvY2F0aW9uLiBCdXQgdGhlIDEyOGtCIHBhcnQgaXMgbm90IHJlbGV2YW50IHRvIHRo
ZSAiYnVnIiBoZXJlIHJlYWxseS4KClRoZSB3YXJuIG9uIGdldHRpbmcgdHJpcHBlZCBpbiBicGZf
eGRwX2FkanVzdF90YWlsIGlzIGJlY2F1c2UgeGRwCmdlbmVyaWMgcGF0aCBpcyBza2IgYmFzZWQg
YW5kIGNhbiBoYXZlIGEgZnJhbWVfc3ogPiA0a0IuIFRoYXQncyB3aGF0IHRoZQpzcGxhdCBpcyBh
Ym91dC4KClBlcmhhcHMgdGhlIHNvbHV0aW9uIGlzIHRvIHJlbW92ZSB0aGUgV0FSTl9PTi4KCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1rZXJu
ZWwtbWVudGVlcyBtYWlsaW5nIGxpc3QKTGludXgta2VybmVsLW1lbnRlZXNAbGlzdHMubGludXhm
b3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1rZXJuZWwtbWVudGVlcwo=
