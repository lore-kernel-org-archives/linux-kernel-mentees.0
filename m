Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54413C04FFE
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 20 Sep 2023 21:14:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0980C81395;
	Wed, 20 Sep 2023 21:14:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0980C81395
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=OVtEQlBJ
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kYs5hztOEHrK; Wed, 20 Sep 2023 21:14:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 0DB21811A9;
	Wed, 20 Sep 2023 21:14:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0DB21811A9
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DDF1BC0071;
	Wed, 20 Sep 2023 21:14:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0AF3CC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 Sep 2023 21:14:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A586A6139A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 Sep 2023 21:14:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A586A6139A
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=OVtEQlBJ
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oAZD9GeGTYci
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 Sep 2023 21:14:01 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D19A96134C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 Sep 2023 21:14:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D19A96134C
Received: from [192.168.2.59] (109-252-153-31.dynamic.spd-mgts.ru
 [109.252.153.31])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 9A50F6607243;
 Wed, 20 Sep 2023 22:13:57 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1695244438;
 bh=AEY7xSy+XlWvC67wCNaiGkWUgOsbIuFYHHmnxBCjy3I=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=OVtEQlBJBAtJi9tb4FkbfpRmsugl2ETOMWGjfNX2zARe4zatOkyv2qFJys4qpZtAF
 +Pd04c3WENeHGNveAmVQjypZBCeUc+c3fmfZbTJ2yHcQiA7cdicWuFvMkGH+n3TRTC
 xMNh9WWDUw4RunEtbk8xx8tLFjrKDMQJOSJGXl9t3FkCbgj0JSaYOa8v/SiZtqvHp2
 EcMhgaMKvguYPbjpwINvIxme70frCQjPc81NrM7RCkxjaGlNIzwfyrePkf6ASLYE+o
 mf9DkAuGVNsiaI/F26kgzkV66Gg9aLL+UXmsce2VOVwbfv1f+LeTqxhXQFWC8u9ttg
 75roO4Mdw5y1Q==
Message-ID: <e944b37b-87e2-5cd4-1140-f7bb7e28519f@collabora.com>
Date: Thu, 21 Sep 2023 00:13:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] drm/virtio: clean out_fence on complete_submit
Content-Language: en-US
To: =?UTF-8?Q?Jos=c3=a9_Pekkarinen?= <jose.pekkarinen@foxhound.fi>,
 airlied@redhat.com, kraxel@redhat.com, skhan@linuxfoundation.org
References: <20230912060824.5210-1-jose.pekkarinen@foxhound.fi>
In-Reply-To: <20230912060824.5210-1-jose.pekkarinen@foxhound.fi>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, Rob Clark <robdclark@gmail.com>,
 gurchetansingh@chromium.org, linux-kernel-mentees@lists.linuxfoundation.org,
 christian.koenig@amd.com
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
From: Dmitry Osipenko via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

T24gOS8xMi8yMyAwOTowOCwgSm9zw6kgUGVra2FyaW5lbiB3cm90ZToKPiBUaGUgcmVtb3ZlZCBs
aW5lIHByZXZlbnRzIHRoZSBmb2xsb3dpbmcgY2xlYW51cCBmdW5jdGlvbgo+IHRvIGV4ZWN1dGUg
YSBkbWFfZmVuY2VfcHV0IG9uIHRoZSBvdXRfZmVuY2UgdG8gZnJlZSBpdHMKPiBtZW1vcnksIHBy
b2R1Y2luZyB0aGUgZm9sbG93aW5nIG91dHB1dCBpbiBrbWVtbGVhazoKPiAKPiB1bnJlZmVyZW5j
ZWQgb2JqZWN0IDB4ZmZmZjg4ODEyNmQ4ZWUwMCAoc2l6ZSAxMjgpOgo+ICAgY29tbSAia3dpbl93
YXlsYW5kIiwgcGlkIDk4MSwgamlmZmllcyA0Mjk1MzgwMjk2IChhZ2UgMzkwLjA2MHMpCj4gICBo
ZXggZHVtcCAoZmlyc3QgMzIgYnl0ZXMpOgo+ICAgICBjOCBhMSBjMiAyNyA4MSA4OCBmZiBmZiBl
MCAxNCBhOSBjMCBmZiBmZiBmZiBmZiAgLi4uJy4uLi4uLi4uLi4uLgo+ICAgICAzMCAxYSBlMSAy
ZSBhNiAwMCAwMCAwMCAyOCBmYyA1YiAxNyA4MSA4OCBmZiBmZiAgMC4uLi4uLi4oLlsuLi4uLgo+
ICAgYmFja3RyYWNlOgo+ICAgICBbPDAwMDAwMDAwMTE2NTU2NjE+XSBrbWFsbG9jX3RyYWNlKzB4
MjYvMHhhMAo+ICAgICBbPDAwMDAwMDAwNTVmMTViODI+XSB2aXJ0aW9fZ3B1X2ZlbmNlX2FsbG9j
KzB4NDcvMHhjMCBbdmlydGlvX2dwdV0KPiAgICAgWzwwMDAwMDAwMGZhNmQ5NmY5Pl0gdmlydGlv
X2dwdV9leGVjYnVmZmVyX2lvY3RsKzB4MWE4LzB4ODAwIFt2aXJ0aW9fZ3B1XQo+ICAgICBbPDAw
MDAwMDAwZTZjYjUxMDU+XSBkcm1faW9jdGxfa2VybmVsKzB4MTY5LzB4MjQwIFtkcm1dCj4gICAg
IFs8MDAwMDAwMDA1YWQzM2UyNz5dIGRybV9pb2N0bCsweDM5OS8weDZiMCBbZHJtXQo+ICAgICBb
PDAwMDAwMDAwYTE5ZGJmNjU+XSBfX3g2NF9zeXNfaW9jdGwrMHhjNS8weDEwMAo+ICAgICBbPDAw
MDAwMDAwMTFmYTgwMWU+XSBkb19zeXNjYWxsXzY0KzB4NWIvMHhjMAo+ICAgICBbPDAwMDAwMDAw
NjVjNzZkOGE+XSBlbnRyeV9TWVNDQUxMXzY0X2FmdGVyX2h3ZnJhbWUrMHg2ZS8weGQ4Cj4gdW5y
ZWZlcmVuY2VkIG9iamVjdCAweGZmZmY4ODgxMjE5MzA1MDAgKHNpemUgMTI4KToKPiAgIGNvbW0g
Imt3aW5fd2F5bGFuZCIsIHBpZCA5ODEsIGppZmZpZXMgNDI5NTM4MDMxMyAoYWdlIDM5MC4wOTZz
KQo+ICAgaGV4IGR1bXAgKGZpcnN0IDMyIGJ5dGVzKToKPiAgICAgYzggYTEgYzIgMjcgODEgODgg
ZmYgZmYgZTAgMTQgYTkgYzAgZmYgZmYgZmYgZmYgIC4uLicuLi4uLi4uLi4uLi4KPiAgICAgZjkg
ZWMgZDcgMmYgYTYgMDAgMDAgMDAgMjggZmMgNWIgMTcgODEgODggZmYgZmYgIC4uLi8uLi4uKC5b
Li4uLi4KPiAgIGJhY2t0cmFjZToKPiAgICAgWzwwMDAwMDAwMDExNjU1NjYxPl0ga21hbGxvY190
cmFjZSsweDI2LzB4YTAKPiAgICAgWzwwMDAwMDAwMDU1ZjE1YjgyPl0gdmlydGlvX2dwdV9mZW5j
ZV9hbGxvYysweDQ3LzB4YzAgW3ZpcnRpb19ncHVdCj4gICAgIFs8MDAwMDAwMDBmYTZkOTZmOT5d
IHZpcnRpb19ncHVfZXhlY2J1ZmZlcl9pb2N0bCsweDFhOC8weDgwMCBbdmlydGlvX2dwdV0KPiAg
ICAgWzwwMDAwMDAwMGU2Y2I1MTA1Pl0gZHJtX2lvY3RsX2tlcm5lbCsweDE2OS8weDI0MCBbZHJt
XQo+ICAgICBbPDAwMDAwMDAwNWFkMzNlMjc+XSBkcm1faW9jdGwrMHgzOTkvMHg2YjAgW2RybV0K
PiAgICAgWzwwMDAwMDAwMGExOWRiZjY1Pl0gX194NjRfc3lzX2lvY3RsKzB4YzUvMHgxMDAKPiAg
ICAgWzwwMDAwMDAwMDExZmE4MDFlPl0gZG9fc3lzY2FsbF82NCsweDViLzB4YzAKPiAgICAgWzww
MDAwMDAwMDY1Yzc2ZDhhPl0gZW50cnlfU1lTQ0FMTF82NF9hZnRlcl9od2ZyYW1lKzB4NmUvMHhk
OAo+IFsuLi5dCj4gCj4gVGhpcyBtZW1sZWFrIHdpbGwgZ3JvdyBxdWlja2x5LCBiZWluZyBwb3Nz
aWJsZSB0byBzZWUgdGhlCj4gZm9sbG93aW5nIGxpbmUgaW4gZG1lc2cgYWZ0ZXIgZmV3IG1pbnV0
ZXMgb2YgbGlmZSBpbiB0aGUKPiB2aXJ0dWFsIG1hY2hpbmU6Cj4gCj4gWyAgNzA2LjIxNzM4OF0g
a21lbWxlYWs6IDEwNzMxIG5ldyBzdXNwZWN0ZWQgbWVtb3J5IGxlYWtzIChzZWUgL3N5cy9rZXJu
ZWwvZGVidWcva21lbWxlYWspCj4gCj4gVGhlIHBhdGNoIHdpbGwgcmVtb3ZlIHRoZSBsaW5lIHRv
IGFsbG93IHRoZSBjbGVhbnVwCj4gZnVuY3Rpb24gZG8gaXRzIGpvYi4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBKb3PDqSBQZWtrYXJpbmVuIDxqb3NlLnBla2thcmluZW5AZm94aG91bmQuZmk+Cj4gLS0t
Cj4gIGRyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9zdWJtaXQuYyB8IDEgLQo+ICAxIGZp
bGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQoKQWRkZWQgZml4ZXMgdGFnIGFuZCBwdXNoZWQgdG8g
bWlzYy1maXhlcwoKLS0gCkJlc3QgcmVnYXJkcywKRG1pdHJ5CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1rZXJuZWwtbWVudGVlcyBtYWlsaW5n
IGxpc3QKTGludXgta2VybmVsLW1lbnRlZXNAbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZwpodHRw
czovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1rZXJu
ZWwtbWVudGVlcwo=
