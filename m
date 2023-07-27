Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9D7CC0015E
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 27 Jul 2023 11:13:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3FC066058D;
	Thu, 27 Jul 2023 11:13:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3FC066058D
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Kyr/Injy
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1lU2rv0lSXr5; Thu, 27 Jul 2023 11:13:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id D2192600CA;
	Thu, 27 Jul 2023 11:13:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D2192600CA
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A1201C0071;
	Thu, 27 Jul 2023 11:13:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A2855C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Jul 2023 11:13:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 83896401A4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Jul 2023 11:13:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 83896401A4
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=Kyr/Injy
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TdZZd3yOgPS3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Jul 2023 11:13:19 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F18C74000B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Jul 2023 11:13:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F18C74000B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690456397;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kIORYueR8tQwkIlZ8oUtnpd4mJbrxO/lMh2S7W9x4Wk=;
 b=Kyr/Injyw9gQVBhEhOB9kMZ6p65tCg3kqeWGg9MdRXkRN3ifP3594GXXclrR1aSCw9jhhp
 TjvGGLZjmuJw0A3NGS21eIsvKRd1V9WqWxU1Zt/6f/HHuBW8oostmKKUFOSOHWlJ6F9K1u
 WghPJHfsIsuz7YaKEQri8XXHMRf6Dvk=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-487-p09wEz_FOhCleWvXOWMGow-1; Thu, 27 Jul 2023 07:13:14 -0400
X-MC-Unique: p09wEz_FOhCleWvXOWMGow-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-99bb3a2c781so49162766b.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Jul 2023 04:13:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690456393; x=1691061193;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :to:subject:cc:user-agent:mime-version:date:message-id:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kIORYueR8tQwkIlZ8oUtnpd4mJbrxO/lMh2S7W9x4Wk=;
 b=Q/Nf/CAtzSFL7yE6lXkGLCZqYgZU34QUObJ8yXw5FRIaSYlDM4k4+TZ+lJ1uoEvVPk
 8VeydkvAR+sBbVWuG1ksngbe4HuX6M11pYXtJ1cHjPUU19SjveXC0GRKwQSBujHGU/CZ
 +gwX7AtxjAvvfM+nJJ/7gqgxkR+xDPTW5rp3dK6RFp5HcGimnKb6d+V7O562uiR4G2Na
 7lioRMQK3ialm4IWuqRZOD1P5mUlES6fSVsNdrKeIG/60Y+/osfwS702PXQKtAmmSo69
 VKI/fn+tHNRIhKuqrfz8NFI/56LipEdST/cM7Ja+0bsfr8oZy8Zl7h34fJcqZx0GBeP1
 TGRw==
X-Gm-Message-State: ABy/qLYZJv9FCwOIVZ3uc+aFtWVRj7K4GqWa2EBVyf3wPe75Otql9e7S
 emVNw+nCKd9W4QvsoNIf3J/tSOxuoB+y7M+p1xpScGC9yXpdo8wECL8+PhFZyjmHW+iu9shTuY8
 /6SpekmYY7If7lf+pmKu30srUBd2hctCywv2kjVmjbymRkBvM
X-Received: by 2002:a17:906:3197:b0:98d:cd3e:c18f with SMTP id
 23-20020a170906319700b0098dcd3ec18fmr1598506ejy.72.1690456393076; 
 Thu, 27 Jul 2023 04:13:13 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFqK3O/7UO1KFVznkNq/qxTau4FDVlTt2cWwvQU0tJR/j+Id5u3sfes/xs7+rhzr3XHCaWT3A==
X-Received: by 2002:a17:906:3197:b0:98d:cd3e:c18f with SMTP id
 23-20020a170906319700b0098dcd3ec18fmr1598485ejy.72.1690456392762; 
 Thu, 27 Jul 2023 04:13:12 -0700 (PDT)
Received: from [192.168.42.222] (194-45-78-10.static.kviknet.net.
 [194.45.78.10]) by smtp.gmail.com with ESMTPSA id
 u7-20020a170906408700b009786ae9ed50sm634077ejj.194.2023.07.27.04.13.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jul 2023 04:13:11 -0700 (PDT)
From: Jesper Dangaard Brouer <jbrouer@redhat.com>
X-Google-Original-From: Jesper Dangaard Brouer <brouer@redhat.com>
Message-ID: <3659ea35-8d03-aae7-53c0-09181bb1b69d@redhat.com>
Date: Thu, 27 Jul 2023 13:13:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3] drivers: net: prevent tun_get_user() to exceed xdp
 size limits
To: Paolo Abeni <pabeni@redhat.com>, Jason Wang <jasowang@redhat.com>,
 David Ahern <dsahern@gmail.com>
References: <20230725155403.796-1-andrew.kanner@gmail.com>
 <CACGkMEt=Cd8J995+0k=6MT1Pj=Fk9E_r2eZREptLt2osj_H-hA@mail.gmail.com>
 <ab722ec1-ae45-af1f-b869-e7339402c852@redhat.com>
 <179979e6-eb8a-0300-5445-999b9366250a@gmail.com>
 <0c06b067-349c-9fe2-2cc3-36c149fd5277@gmail.com>
 <CACGkMEsYzd1FphP-Ym9T9YjA9ZNBw7Mnw5xQ75dytQMJxDK3cg@mail.gmail.com>
 <220fc36ba1086c1390ba087d08561b61762c965a.camel@redhat.com>
In-Reply-To: <220fc36ba1086c1390ba087d08561b61762c965a.camel@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: syzbot+f817490f5bd20541b90a@syzkaller.appspotmail.com,
 netdev@vger.kernel.org, John Fastabend <john.fastabend@gmail.com>,
 Jesper Dangaard Brouer <jbrouer@redhat.com>, linux-kernel@vger.kernel.org,
 edumazet@google.com, brouer@redhat.com, kuba@kernel.org,
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

CgpPbiAyNy8wNy8yMDIzIDExLjMwLCBQYW9sbyBBYmVuaSB3cm90ZToKPiBPbiBUaHUsIDIwMjMt
MDctMjcgYXQgMTQ6MDcgKzA4MDAsIEphc29uIFdhbmcgd3JvdGU6Cj4+IE9uIFRodSwgSnVsIDI3
LCAyMDIzIGF0IDg6MjfigK9BTSBEYXZpZCBBaGVybiA8ZHNhaGVybkBnbWFpbC5jb20+IHdyb3Rl
Ogo+Pj4KPj4+IE9uIDcvMjYvMjMgMTozNyBQTSwgRGF2aWQgQWhlcm4gd3JvdGU6Cj4+Pj4gT24g
Ny8yNi8yMyAzOjAyIEFNLCBKZXNwZXIgRGFuZ2FhcmQgQnJvdWVyIHdyb3RlOgo+Pj4+PiBDYy4g
Sm9obiBhbmQgQWhlcm4KPj4+Pj4KPj4+Pj4gT24gMjYvMDcvMjAyMyAwNC4wOSwgSmFzb24gV2Fu
ZyB3cm90ZToKPj4+Pj4+IE9uIFR1ZSwgSnVsIDI1LCAyMDIzIGF0IDExOjU04oCvUE0gQW5kcmV3
IEthbm5lcgo+Pj4+Pj4gPGFuZHJldy5rYW5uZXJAZ21haWwuY29tPiB3cm90ZToKPj4+Pj4+Pgo+
Pj4+Pj4+IFN5emthbGxlciByZXBvcnRlZCB0aGUgZm9sbG93aW5nIGlzc3VlOgo+Pj4+Pj4+ID09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQo+Pj4+Pj4+IFRvbyBCSUcgeGRw
LT5mcmFtZV9zeiA9IDEzMTA3Mgo+Pj4+Pgo+Pj4+PiBJcyB0aGlzIGEgY29udGlndW91cyBwaHlz
aWNhbCBtZW1vcnkgYWxsb2NhdGlvbj8KPj4+Pj4KPj4+Pj4gMTMxMDcyIGJ5dGVzIGVxdWFsIG9y
ZGVyIDUgcGFnZS4KPj4+Pj4KPj4+Pj4gTG9va2luZyBhdCB0dW4uYyBjb2RlIEkgY2Fubm90IGZp
bmQgYSBjb2RlIHBhdGggdGhhdCBjb3VsZCBjcmVhdGUKPj4+Pj4gb3JkZXItNSBza2ItPmRhdGEs
IGJ1dCBvbmx5IFNLQiB3aXRoIG9yZGVyLTAgZnJhZ21lbnRzLiAgQnV0IEkgZ3Vlc3MgaXQKPj4+
Pj4gaXMgdGhlIG5ldGlmX3JlY2VpdmVfZ2VuZXJpY194ZHAoKSB3aGF0IHdpbGwgcmVhbGxvYyB0
byBtYWtlIHRoaXMgbGluZWFyCj4+Pj4+ICh2aWEgc2tiX2xpbmVhcml6ZSgpKQo+Pj4+Cj4+Pj4K
Pj4+PiBnZXRfdHVuX3VzZXIgaXMgcGFzc2VkIGFuIGlvdl9pdGVyIHdpdGggYSBzaW5nbGUgc2Vn
bWVudCBvZiA2NTAwNwo+Pj4+IHRvdGFsX2xlbi4gVGhlIGFsbG9jX3NrYiBwYXRoIGlzIGhpdCB3
aXRoIGFuIGFsaWduIHNpemUgb2Ygb25seSA2NC4gVGhhdAo+Pj4+IGlzIGluc3VmZmljaWVudCBm
b3IgWERQIHNvIHRoZSBuZXRpZl9yZWNlaXZlX2dlbmVyaWNfeGRwIGhpdHMgdGhlCj4+Pj4gcHNr
Yl9leHBhbmRfaGVhZCBwYXRoLiBTb21ldGhpbmcgaXMgb2ZmIGluIHRoZSBtYXRoIGluCj4+Pj4g
bmV0aWZfcmVjZWl2ZV9nZW5lcmljX3hkcCByZXN1bHRpbmcgaW4gdGhlIHNrYiBtYXJrZXJzIGJl
aW5nIG9mZi4gVGhhdAo+Pj4+IGNhdXNlcyBicGZfcHJvZ19ydW5fZ2VuZXJpY194ZHAgdG8gY29t
cHV0ZSB0aGUgd3JvbmcgZnJhbWVfc3ouCj4+Pgo+Pj4KPj4+IEJUVywgaXQgaXMgcHNrYl9leHBh
bmRfaGVhZCB0aGF0IHR1cm5zIGl0IGZyb20gYSA2NGtCIHRvIGEgMTI4IGtCCj4+PiBhbGxvY2F0
aW9uLiBCdXQgdGhlIDEyOGtCIHBhcnQgaXMgbm90IHJlbGV2YW50IHRvIHRoZSAiYnVnIiBoZXJl
IHJlYWxseS4KPj4+CgpUcnVlLCBpdCBpcyBhbm90aGVyICJidWciL3VuZXhwZWN0ZWQtYmVoYXZp
b3IgdGhhdCBTS0IgZ2V0cyByZWFsbG9jYXRlZAp0byBiZSAxMjhLaUIuIFdlIHNob3VsZCBsaWtl
bHkgc29sdmUgdGhpcyBpbiBhbm90aGVyIHBhdGNoLgoKPj4+IFRoZSB3YXJuIG9uIGdldHRpbmcg
dHJpcHBlZCBpbiBicGZfeGRwX2FkanVzdF90YWlsIGlzIGJlY2F1c2UgeGRwCj4+PiBnZW5lcmlj
IHBhdGggaXMgc2tiIGJhc2VkIGFuZCBjYW4gaGF2ZSBhIGZyYW1lX3N6ID4gNGtCLiBUaGF0J3Mg
d2hhdCB0aGUKPj4+IHNwbGF0IGlzIGFib3V0LgoKQWdyZWUsIHRoYXQgdGhlIHdhcm4gY29uZGl0
aW9uIHNob3VsZCBiZSBjaGFuZ2VkLCBldmVuIHJlbW92ZWQuCkl0IGlzIGludGVyZXN0aW5nIHRo
YXQgdGhpcyB3YXJuIGNhdWdodCB0aGlzIHVuZXhwZWN0ZWQtYmVoYXZpb3Igb2YKZXhwYW5kaW5n
IHRvIDEyOEtpQi4KCj4+Cj4+IE90aGVyIHBvc3NpYmlsaXR5Ogo+Pgo+PiB0dW5fY2FuX2J1aWxk
X3NrYigpIGRvZXNuJ3QgY291bnQgWERQX1BBQ0tFVF9IRUFEUk9PTSB0aGlzIG1heSBlbmQgdXAK
Pj4gd2l0aCBwcm9kdWNpbmcgYSBmcmFtZV9zeiB3aGljaCBpcyBncmVhdGVyIHRoYW4gUEFHRV9T
SVpFIGFzIHdlbGwgaW4KPj4gdHVuX2J1aWxkX3NrYigpLgoKVHJ1ZSwgYW5kIHRoZSB3YXkgSSBy
ZWFkIHRoZSB0dW5fYnVpbGRfc2tiKCkgY29kZSwgdmlhIApza2JfcGFnZV9mcmFnX3JlZmlsbCgp
LAppdCBjYW4gcHJvZHVjZSBhbiBTS0Igd2l0aCBkYXRhIHNpemUgKGJ1ZmxlbikgdXB0byBvcmRl
ci0zID0gMzJLaUIgCihTS0JfRlJBR19QQUdFX09SREVSKS4KClRodXMsIHRoZSBleGlzdGluZyBj
aGVjayBpbiB0dW5fY2FuX2J1aWxkX3NrYigpIGZvciBQQUdFX1NJWkUgY2FuL3Nob3VsZCAKYmUg
cmVsYXhlZD8KKFBsZWFzZSBjb3JyZWN0IG1lIGFzIEkgZG9uJ3QgZnVsbHkgdW5kZXJzdGFuZCB0
dW5fZ2V0X3VzZXIoKSBjb2RlKQoKPj4KPj4gQW5kIHJldGhpbmsgdGhpcyBwYXRjaCwgaXQgbG9v
a3Mgd3Jvbmcgc2luY2UgaXQgYmFzaWNhbGx5IGRyb3BzIGFsbAo+PiBwYWNrZXRzIHdob3NlIGJ1
ZmxlbiBpcyBncmVhdGVyIHRoYW4gUEFHRV9TSVpFIHNpbmNlIGl0IGNhbid0IGZhbGwKPj4gYmFj
ayB0byB0dW5fYWxsb2Nfc2tiKCkuCj4+CgpJIGFncmVlLCB0aGlzIGlzIHdoeSBJIHJlYWN0ZWQs
IGFzIHRoaXMgdmVyc2lvbiBvZiB0aGUgcGF0Y2ggY291bGQKcG90ZW50aWFsbHkgY2F1c2UgaXNz
dWVzIGFuZCBwYWNrZXQgZHJvcHMuCgo+Pj4KPj4+IFBlcmhhcHMgdGhlIHNvbHV0aW9uIGlzIHRv
IHJlbW92ZSB0aGUgV0FSTl9PTi4KPj4KPj4gWWVzLCB0aGF0IGlzIHdoYXQgSSdtIGFza2luZyBp
ZiB0aGlzIHdhcm5pbmcgc3RpbGwgbWFrZXMgc2Vuc2UgaW4gVjEuCj4gCj4gSSB1bmRlcnN0YW5k
IHRoZSBjb25zZW5zdXMgaXMgc29sdmluZyB0aGUgaXNzdWUgYnkgY2hhbmdpbmcvcmVtb3ZpbmcK
PiB0aGUgV0FSTl9PTigpIGluIFhEUC4gSSB0aGluayBpdCBtYWtlcyBzZW5zZSwgSSBndWVzcyB0
aGUgc2FtZSB3YXJuIGNhbgo+IGJlIHJlYWNoZWQgdmlhIHBhY2tldCBzb2NrZXQgeG1pdCBvbiB2
ZXRoIG9yIHNpbWlsYXIgdG9wb2xvZ3kuCj4gCgpZZXMsIHdlIGNhbiBjb21wbGV0ZWx5IHJlbW92
ZSB0aGlzIGNoZWNrLiAgVGhlIG9yaWdpbmFsIGludGVuZCB3YXMgdG8KY2F0Y2ggY2FzZXMgd2hl
cmUgWERQIGRyaXZlcnMgaGF2ZSBub3QgYmVlbiB1cGRhdGVkIHRvIHVzZSB4ZHAuZnJhbWVfc3os
CmJ1dCB0aGF0IGlzIG5vdCBsb25nZXIgYSBjb25jZXJuIChzaW5jZSB4ZHBfaW5pdF9idWZmKS4K
Ckl0IHdhcyBhZGRlZCAoYnkgbWUpIGluIGNvbW1pdDoKICAtIGM4NzQxZTJiZmU4NyAoInhkcDog
QWxsb3cgYnBmX3hkcF9hZGp1c3RfdGFpbCgpIHRvIGdyb3cgcGFja2V0IHNpemUiKQogICAgLSB2
NS44LXJjMQogIC0gYXMgcGFydCBvZiBtZXJnZSA1Y2M1OTI0ZDgzMTUKCkknbSBzdXJlIGl0IGlz
IHNhZmUgdG8gcmVtb3ZlIHNpbmNlIGNvbW1pdDoKICAtIDQzYjUxNjlkODM1NSAoIm5ldCwgeGRw
OiBJbnRyb2R1Y2UgeGRwX2luaXRfYnVmZiB1dGlsaXR5IHJvdXRpbmUiKQogICAgLSB2NS4xMi1y
YzEKCndoZXJlIHdlIGludHJvZHVjZWQgeGRwX2luaXRfYnVmZigpIGhlbHBlciwgd2hpY2ggYWxs
IFhEUCBkcml2ZXIgdXNlIHRvZGF5LgpRdWVzdGlvbiBpcyB3aGF0ICJGaXhlczoiIHRhZyBzaG91
bGQgdGhlIHBhdGNoIGhhdmU/CgpUbyBBbmRyZXcsIHdpbGwgeW91CiAgKDEpIHNlbmQgYSBuZXcg
cGF0Y2ggdGhhdCByZW1vdmVzIHRoaXMgY2hlY2sgaW5zdGVhZD8KICAoMikgaGF2ZSBjeWNsZXMg
dG8gaW52ZXN0aWdhdGUgd2h5IHRoZSB1bmV4cGVjdGVkLWJlaGF2aW9yIG9mCmV4cGFuZGluZyB0
byAxMjhLaUIgaGFwcGVucz8KCi0tSmVzcGVyCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1rZXJuZWwtbWVudGVlcyBtYWlsaW5nIGxpc3QKTGlu
dXgta2VybmVsLW1lbnRlZXNAbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3Rz
LmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1rZXJuZWwtbWVudGVl
cwo=
