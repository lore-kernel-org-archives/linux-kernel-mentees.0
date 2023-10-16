Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00671CDB474
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 16 Oct 2023 16:46:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 75E5F611CB;
	Mon, 16 Oct 2023 16:46:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 75E5F611CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2-kuwDsTqsQp; Mon, 16 Oct 2023 16:46:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 49A9B611AE;
	Mon, 16 Oct 2023 16:46:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 49A9B611AE
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 228D8C0039;
	Mon, 16 Oct 2023 16:46:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E3AA1C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Oct 2023 16:46:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AB47C40929
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Oct 2023 16:46:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB47C40929
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GnLIcf_J4jn4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Oct 2023 16:46:40 +0000 (UTC)
X-Greylist: delayed 3283 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 16 Oct 2023 16:46:40 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5772140915
Received: from 3.mo576.mail-out.ovh.net (3.mo576.mail-out.ovh.net
 [188.165.52.203])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5772140915
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Oct 2023 16:46:40 +0000 (UTC)
Received: from director5.ghost.mail-out.ovh.net (unknown [10.109.138.205])
 by mo576.mail-out.ovh.net (Postfix) with ESMTP id 35C0921885
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Oct 2023 15:51:55 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-z9f7w (unknown [10.110.171.76])
 by director5.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 9D0191FE94;
 Mon, 16 Oct 2023 15:51:54 +0000 (UTC)
Received: from RCM-web7.webmail.mail.ovh.net ([151.80.29.19])
 by ghost-submission-6684bf9d7b-z9f7w with ESMTPSA
 id pvT0JBpcLWU2DwEAAnawRQ
 (envelope-from <jose.pekkarinen@foxhound.fi>); Mon, 16 Oct 2023 15:51:54 +0000
MIME-Version: 1.0
Date: Mon, 16 Oct 2023 18:51:54 +0300
From: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@foxhound.fi>
To: dmitry.torokhov@gmail.com, rydberg@bitmath.org, skhan@linuxfoundation.org
Subject: Re: [PATCH] Input: synaptics: enable InterTouch for ThinkPad L14 G1
In-Reply-To: <20231008080129.17931-1-jose.pekkarinen@foxhound.fi>
References: <20231008080129.17931-1-jose.pekkarinen@foxhound.fi>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <5d857ff972e9203ef65ae2396c7285c0@foxhound.fi>
X-Sender: jose.pekkarinen@foxhound.fi
Organization: Foxhound Ltd.
X-Originating-IP: 185.220.101.52
X-Webmail-UserID: jose.pekkarinen@foxhound.fi
X-Ovh-Tracer-Id: 6636898479886935718
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedrjedtgdeltdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhepggffhffvvefujghffgfkgihoihgtgfesthekjhdttderjeenucfhrhhomheplfhoshorucfrvghkkhgrrhhinhgvnhcuoehjohhsvgdrphgvkhhkrghrihhnvghnsehfohighhhouhhnugdrfhhiqeenucggtffrrghtthgvrhhnpeekhfeguddufeegvdelgedtvdffgeehvddtkeevkeejvedvgeeitdefleehtdeitdenucfkphepuddvjedrtddrtddruddpudekhedrvddvtddruddtuddrhedvpdduhedurdektddrvdelrdduleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehjohhsvgdrphgvkhhkrghrihhnvghnsehfohighhhouhhnugdrfhhiqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhdqmhgvnhhtvggvsheslhhishhtshdrlhhinhhugihfohhunhgurghtihhonhdrohhrghdpoffvtefjohhsthepmhhoheejiedpmhhouggvpehsmhhtphhouhht
Cc: rrangel@chromium.org, amandhoot12@gmail.com, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-input@vger.kernel.org
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

T24gMjAyMy0xMC0wOCAxMTowMSwgSm9zw6kgUGVra2FyaW5lbiB3cm90ZToKPiBPYnNlcnZlZCBv
biBkbWVzZyBvZiBteSBsYXB0b3AgSSBzZWUgdGhlIGZvbGxvd2luZwo+IG91dHB1dDoKPiAKPiBb
ICAgMTkuODk4NzAwXSBwc21vdXNlIHNlcmlvMTogc3luYXB0aWNzOiBxdWVyaWVkIG1heCBjb29y
ZGluYXRlczogeAo+IFsuLjU2NzhdLCB5IFsuLjQ2OTRdCj4gWyAgIDE5LjkzNjA1N10gcHNtb3Vz
ZSBzZXJpbzE6IHN5bmFwdGljczogcXVlcmllZCBtaW4gY29vcmRpbmF0ZXM6IHgKPiBbMTI2Ni4u
XSwgeSBbMTE2Mi4uXQo+IFsgICAxOS45MzYwNzZdIHBzbW91c2Ugc2VyaW8xOiBzeW5hcHRpY3M6
IFlvdXIgdG91Y2hwYWQgKFBOUDogTEVOMDQxMQo+IFBOUDBmMTMpIHNheXMgaXQgY2FuIHN1cHBv
cnQgYSBkaWZmZXJlbnQgYnVzLiBJZiBpMmMtaGlkIGFuZCBoaWQtcm1pCj4gYXJlIG5vdCB1c2Vk
LCB5b3UgbWlnaHQgd2FudCB0byB0cnkgc2V0dGluZwo+IHBzbW91c2Uuc3luYXB0aWNzX2ludGVy
dG91Y2ggdG8gMSBhbmQgcmVwb3J0IHRoaXMgdG8KPiBsaW51eC1pbnB1dEB2Z2VyLmtlcm5lbC5v
cmcuCj4gWyAgIDIwLjAwODkwMV0gcHNtb3VzZSBzZXJpbzE6IHN5bmFwdGljczogVG91Y2hwYWQg
bW9kZWw6IDEsIGZ3Ogo+IDEwLjMyLCBpZDogMHgxZTJhMSwgY2FwczogMHhmMDE0YTMvMHg5NDAz
MDAvMHgxMmU4MDAvMHg1MDAwMDAsIGJvYXJkCj4gaWQ6IDM0NzEsIGZ3IGlkOiAyOTA5NjQwCj4g
WyAgIDIwLjAwODkyNV0gcHNtb3VzZSBzZXJpbzE6IHN5bmFwdGljczogc2VyaW86IFN5bmFwdGlj
cwo+IHBhc3MtdGhyb3VnaCBwb3J0IGF0IGlzYTAwNjAvc2VyaW8xL2lucHV0MAo+IFsgICAyMC4w
NTMzNDRdIGlucHV0OiBTeW5QUy8yIFN5bmFwdGljcyBUb3VjaFBhZCBhcwo+IC9kZXZpY2VzL3Bs
YXRmb3JtL2k4MDQyL3NlcmlvMS9pbnB1dC9pbnB1dDcKPiBbICAgMjAuMzk3NjA4XSBtb3VzZWRl
djogUFMvMiBtb3VzZSBkZXZpY2UgY29tbW9uIGZvciBhbGwgbWljZQo+IAo+IFRoaXMgcGF0Y2gg
d2lsbCBhZGQgaXRzIHBucCBpZCB0byB0aGUgc21idXMgbGlzdCB0bwo+IHByb2R1Y2UgdGhlIHNl
dHVwIG9mIGludGVydG91Y2ggZm9yIHRoZSBkZXZpY2UuIEFmdGVyCj4gYXBwbHlpbmcsIHRoZSBv
dXB1dCB3aWxsIGxvb2sgbGlrZToKPiAKPiBbICAgMTkuMTY4NjY0XSBwc21vdXNlIHNlcmlvMTog
c3luYXB0aWNzOiBxdWVyaWVkIG1heCBjb29yZGluYXRlczogeAo+IFsuLjU2NzhdLCB5IFsuLjQ2
OTRdCj4gWyAgIDE5LjIwNjMxMV0gcHNtb3VzZSBzZXJpbzE6IHN5bmFwdGljczogcXVlcmllZCBt
aW4gY29vcmRpbmF0ZXM6IHgKPiBbMTI2Ni4uXSwgeSBbMTE2Mi4uXQo+IFsgICAxOS4yMDYzMjVd
IHBzbW91c2Ugc2VyaW8xOiBzeW5hcHRpY3M6IFRyeWluZyB0byBzZXQgdXAgU01CdXMgYWNjZXNz
Cj4gWyAgIDE5LjIwOTU0NV0gcHNtb3VzZSBzZXJpbzE6IHN5bmFwdGljczogU01idXMgY29tcGFu
aW9uIGlzIG5vdCByZWFkeSAKPiB5ZXQKPiBbICAgMTkuMjgzODQ1XSBwc21vdXNlIHNlcmlvMTog
c3luYXB0aWNzOiBUb3VjaHBhZCBtb2RlbDogMSwgZnc6Cj4gMTAuMzIsIGlkOiAweDFlMmExLCBj
YXBzOiAweGYwMTRhMy8weDk0MDMwMC8weDEyZTgwMC8weDUwMDAwMCwgYm9hcmQKPiBpZDogMzQ3
MSwgZncgaWQ6IDI5MDk2NDAKPiBbICAgMTkuMjgzODYzXSBwc21vdXNlIHNlcmlvMTogc3luYXB0
aWNzOiBzZXJpbzogU3luYXB0aWNzCj4gcGFzcy10aHJvdWdoIHBvcnQgYXQgaXNhMDA2MC9zZXJp
bzEvaW5wdXQwCj4gWyAgIDE5LjMyODk1OV0gaW5wdXQ6IFN5blBTLzIgU3luYXB0aWNzIFRvdWNo
UGFkIGFzCj4gL2RldmljZXMvcGxhdGZvcm0vaTgwNDIvc2VyaW8xL2lucHV0L2lucHV0OAo+IFsg
ICAxOS43MDYxNjRdIG1vdXNlZGV2OiBQUy8yIG1vdXNlIGRldmljZSBjb21tb24gZm9yIGFsbCBt
aWNlCj4gCj4gU2lnbmVkLW9mZi1ieTogSm9zw6kgUGVra2FyaW5lbiA8am9zZS5wZWtrYXJpbmVu
QGZveGhvdW5kLmZpPgo+IC0tLQo+ICBkcml2ZXJzL2lucHV0L21vdXNlL3N5bmFwdGljcy5jIHwg
MSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+IAo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2lucHV0L21vdXNlL3N5bmFwdGljcy5jIAo+IGIvZHJpdmVycy9pbnB1dC9tb3VzZS9z
eW5hcHRpY3MuYwo+IGluZGV4IGFkYTI5OWVjNWJiYS4uMzc2YTA0MWM4MGIyIDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvaW5wdXQvbW91c2Uvc3luYXB0aWNzLmMKPiArKysgYi9kcml2ZXJzL2lucHV0
L21vdXNlL3N5bmFwdGljcy5jCj4gQEAgLTE4Myw2ICsxODMsNyBAQCBzdGF0aWMgY29uc3QgY2hh
ciAqIGNvbnN0IHNtYnVzX3BucF9pZHNbXSA9IHsKPiAgCSJMRU4wMDliIiwgLyogVDU4MCAqLwo+
ICAJIkxFTjA0MDIiLCAvKiBYMSBFeHRyZW1lIEdlbiAyIC8gUDEgR2VuIDIgKi8KPiAgCSJMRU4w
NDBmIiwgLyogUDEgR2VuIDMgKi8KPiArCSJMRU4wNDExIiwgLyogTDE0IEdlbiAxICovCj4gIAki
TEVOMjAwZiIsIC8qIFQ0NTBzICovCj4gIAkiTEVOMjA0NCIsIC8qIEw0NzAgICovCj4gIAkiTEVO
MjA1NCIsIC8qIEU0ODAgKi8KCiAgICAgQW55IGNvbW1lbnRzIGhlcmU/CgogICAgIFRoYW5rcyEK
CiAgICAgSm9zw6kuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LWtlcm5lbC1tZW50ZWVzIG1haWxpbmcgbGlzdApMaW51eC1rZXJuZWwtbWVudGVl
c0BsaXN0cy5saW51eGZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9u
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWtlcm5lbC1tZW50ZWVzCg==
