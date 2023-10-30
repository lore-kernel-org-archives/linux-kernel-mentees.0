Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A652C4167D
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 30 Oct 2023 16:26:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 240B960A80;
	Mon, 30 Oct 2023 16:26:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 240B960A80
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OtnAuz-vZQU7; Mon, 30 Oct 2023 16:26:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 32DAF60A7F;
	Mon, 30 Oct 2023 16:26:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32DAF60A7F
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0B286C0039;
	Mon, 30 Oct 2023 16:26:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 37B29C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Oct 2023 16:26:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1315960A80
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Oct 2023 16:26:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1315960A80
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VBCAUhcg8P9L
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Oct 2023 16:26:39 +0000 (UTC)
X-Greylist: delayed 108459 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 30 Oct 2023 16:26:38 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E88A60A7F
Received: from 12.mo584.mail-out.ovh.net (12.mo584.mail-out.ovh.net
 [178.33.104.253])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9E88A60A7F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Oct 2023 16:26:38 +0000 (UTC)
Received: from director7.ghost.mail-out.ovh.net (unknown [10.109.143.208])
 by mo584.mail-out.ovh.net (Postfix) with ESMTP id DA4D324FB7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Oct 2023 16:26:35 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-7hln7 (unknown [10.110.208.67])
 by director7.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 16CAE1FE61;
 Mon, 30 Oct 2023 16:26:35 +0000 (UTC)
Received: from RCM-web3.webmail.mail.ovh.net ([178.33.236.78])
 by ghost-submission-6684bf9d7b-7hln7 with ESMTPSA
 id zBVnAzvZP2VUTQEAW38/SQ
 (envelope-from <jose.pekkarinen@foxhound.fi>); Mon, 30 Oct 2023 16:26:35 +0000
MIME-Version: 1.0
Date: Mon, 30 Oct 2023 18:26:34 +0200
From: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@foxhound.fi>
To: Aurabindo Pillai <aurabindo.pillai@amd.com>
Subject: Re: [PATCH] drm/amd/display: remove redundant check
In-Reply-To: <ce1b69e1-fa38-2e12-1ad5-375ac244af42@amd.com>
References: <20231029124404.16159-1-jose.pekkarinen@foxhound.fi>
 <ce1b69e1-fa38-2e12-1ad5-375ac244af42@amd.com>
User-Agent: Roundcube Webmail/1.4.15
Message-ID: <3c228e4f69c01dddd4743bdb68845566@foxhound.fi>
X-Sender: jose.pekkarinen@foxhound.fi
Organization: Foxhound Ltd.
X-Originating-IP: 162.247.74.74
X-Webmail-UserID: jose.pekkarinen@foxhound.fi
X-Ovh-Tracer-Id: 15653104930003855014
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedruddttddgkeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggffhffvvefujghffgfkgihoihgtgfesthekjhdttderjeenucfhrhhomheplfhoshorucfrvghkkhgrrhhinhgvnhcuoehjohhsvgdrphgvkhhkrghrihhnvghnsehfohighhhouhhnugdrfhhiqeenucggtffrrghtthgvrhhnpeekhfeguddufeegvdelgedtvdffgeehvddtkeevkeejvedvgeeitdefleehtdeitdenucfkphepuddvjedrtddrtddruddpudeivddrvdegjedrjeegrdejgedpudejkedrfeefrddvfeeirdejkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehjohhsvgdrphgvkhhkrghrihhnvghnsehfohighhhouhhnugdrfhhiqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhdqmhgvnhhtvggvsheslhhishhtshdrlhhinhhugihfohhunhgurghtihhonhdrohhrghdpoffvtefjohhsthepmhhoheekgedpmhhouggvpehsmhhtphhouhht
Cc: dillon.varone@amd.com, george.shen@amd.com, sunpeng.li@amd.com,
 airlied@gmail.com, dri-devel@lists.freedesktop.org, Xinhui.Pan@amd.com,
 Rodrigo.Siqueira@amd.com, linux-kernel@vger.kernel.org, samson.tam@amd.com,
 SyedSaaem.Rizvi@amd.com, amd-gfx@lists.freedesktop.org, daniel@ffwll.ch,
 alexander.deucher@amd.com, Jun.Lei@amd.com, harry.wentland@amd.com,
 christian.koenig@amd.com, linux-kernel-mentees@lists.linuxfoundation.org
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

T24gMjAyMy0xMC0zMCAxNTo1MiwgQXVyYWJpbmRvIFBpbGxhaSB3cm90ZToKPiBPbiAxMC8yOS8y
MDIzIDg6NDQgQU0sIEpvc8OpIFBla2thcmluZW4gd3JvdGU6Cj4+IFRoaXMgcGF0Y2ggYWRkcmVz
c2VzIHRoZSBmb2xsb3dpbmcgd2FybmluZyBzcG90dGVkIGJ5Cj4+IHVzaW5nIGNvY2NpbmVsbGUg
d2hlcmUgdGhlIGNhc2UgY2hlY2tlZCBkb2VzIHRoZSBzYW1lCj4+IHRoYW4gdGhlIGVsc2UgY2Fz
ZS4KPj4gCj4+IGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kbWwvZGNuMzIvZGlzcGxh
eV9tb2RlX3ZiYV91dGlsXzMyLmM6NDY2NDo4LTEwOiAKPj4gV0FSTklORzogcG9zc2libGUgY29u
ZGl0aW9uIHdpdGggbm8gZWZmZWN0IChpZiA9PSBlbHNlKQo+PiAKPj4gU2lnbmVkLW9mZi1ieTog
Sm9zw6kgUGVra2FyaW5lbiA8am9zZS5wZWtrYXJpbmVuQGZveGhvdW5kLmZpPgo+PiAtLS0KPj4g
ICAuLi4vZHJtL2FtZC9kaXNwbGF5L2RjL2RtbC9kY24zMi9kaXNwbGF5X21vZGVfdmJhX3V0aWxf
MzIuYyAgIHwgNCAKPj4gLS0tLQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCA0IGRlbGV0aW9ucygtKQo+
PiAKPj4gZGlmZiAtLWdpdCAKPj4gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZG1s
L2RjbjMyL2Rpc3BsYXlfbW9kZV92YmFfdXRpbF8zMi5jIAo+PiBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9kYy9kbWwvZGNuMzIvZGlzcGxheV9tb2RlX3ZiYV91dGlsXzMyLmMKPj4gaW5k
ZXggZWNlYTAwOGYxOWQzLi5kOTQwZGZhNWFlNDMgMTAwNjQ0Cj4+IC0tLSAKPj4gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZG1sL2RjbjMyL2Rpc3BsYXlfbW9kZV92YmFfdXRpbF8z
Mi5jCj4+ICsrKyAKPj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZG1sL2RjbjMy
L2Rpc3BsYXlfbW9kZV92YmFfdXRpbF8zMi5jCj4+IEBAIC00NjYxLDEwICs0NjYxLDYgQEAgdm9p
ZCBkbWwzMl9DYWxjdWxhdGVNaW5BbmRNYXhQcmVmZXRjaE1vZGUoCj4+ICAgCX0gZWxzZSBpZiAo
QWxsb3dGb3JQU3RhdGVDaGFuZ2VPclN0dXR0ZXJJblZCbGFua0ZpbmFsID09IAo+PiBkbV9wcmVm
ZXRjaF9zdXBwb3J0X3VjbGtfZmNsa19hbmRfc3R1dHRlcikgewo+PiAgIAkJKk1pblByZWZldGNo
TW9kZSA9IDA7Cj4+ICAgCQkqTWF4UHJlZmV0Y2hNb2RlID0gMDsKPj4gLQl9IGVsc2UgaWYgKEFs
bG93Rm9yUFN0YXRlQ2hhbmdlT3JTdHV0dGVySW5WQmxhbmtGaW5hbCA9PQo+PiAtCQkJZG1fcHJl
ZmV0Y2hfc3VwcG9ydF91Y2xrX2ZjbGtfYW5kX3N0dXR0ZXJfaWZfcG9zc2libGUpIHsKPj4gLQkJ
Kk1pblByZWZldGNoTW9kZSA9IDA7Cj4+IC0JCSpNYXhQcmVmZXRjaE1vZGUgPSAzOwo+PiAgIAl9
IGVsc2Ugewo+PiAgIAkJKk1pblByZWZldGNoTW9kZSA9IDA7Cj4+ICAgCQkqTWF4UHJlZmV0Y2hN
b2RlID0gMzsKPiAKPiBXaGF0IHRyZWUgZGlkIHlvdSB1c2UgdG8gZ2VuZXJhdGUgdGhlIHBhdGNo
PyBPbiBhbWQtc3RhZ2luZy1kcm0tbmV4dCwKPiBNYXhQcmVmZXRjaE1vZGUgaXMgMCBmb3IgdGhl
IHNlY29uZCBsYXN0IGJyYW5jaCwgd2hpY2ggaXMgdGhlIGNvcnJlY3QKPiBvbmUsIHNvIHRoaXMg
cGF0Y2ggaXNudCBuZWVkZWQuCgogICAgIEknbSB1c2luZyB0aGUgc3RhYmxlIHRyZWUsIHNvcnJ5
LCBpZiBpdCBpcyBvdXQgb2YKZGF0ZSBqdXN0IGlnbm9yZSBpdCB0aGVuLgoKICAgICBUaGFua3Mh
CgogICAgIEpvc8OpLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1rZXJuZWwtbWVudGVlcyBtYWlsaW5nIGxpc3QKTGludXgta2VybmVsLW1lbnRl
ZXNAbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlv
bi5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1rZXJuZWwtbWVudGVlcwo=
