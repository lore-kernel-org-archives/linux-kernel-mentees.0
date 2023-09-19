Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C41CCD54B2
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 19 Sep 2023 11:12:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 210DD404C3;
	Tue, 19 Sep 2023 11:12:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 210DD404C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Tyaszxe3c0JP; Tue, 19 Sep 2023 11:12:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 1EA0440359;
	Tue, 19 Sep 2023 11:12:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1EA0440359
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 04629C0039;
	Tue, 19 Sep 2023 11:12:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8D739C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 19 Sep 2023 11:12:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 561AE615B8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 19 Sep 2023 11:12:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 561AE615B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V0w_n8PMFt_g
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 19 Sep 2023 11:12:15 +0000 (UTC)
X-Greylist: delayed 20326 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 19 Sep 2023 11:12:14 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E6DA860F9A
Received: from 15.mo582.mail-out.ovh.net (15.mo582.mail-out.ovh.net
 [188.165.39.161])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E6DA860F9A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 19 Sep 2023 11:12:14 +0000 (UTC)
Received: from director7.ghost.mail-out.ovh.net (unknown [10.108.4.73])
 by mo582.mail-out.ovh.net (Postfix) with ESMTP id E86AF261F5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 19 Sep 2023 11:12:12 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-ql8wh (unknown [10.110.208.79])
 by director7.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 23DBF1FEAC;
 Tue, 19 Sep 2023 11:12:12 +0000 (UTC)
Received: from RCM-web1.webmail.mail.ovh.net ([176.31.238.120])
 by ghost-submission-6684bf9d7b-ql8wh with ESMTPSA
 id LpbEBgyCCWVJ7wcANQvNOQ
 (envelope-from <jose.pekkarinen@foxhound.fi>); Tue, 19 Sep 2023 11:12:12 +0000
MIME-Version: 1.0
Date: Tue, 19 Sep 2023 14:12:11 +0300
From: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@foxhound.fi>
To: airlied@redhat.com, kraxel@redhat.com, skhan@linuxfoundation.org
Subject: Re: [PATCH] drm/virtio: clean out_fence on complete_submit
In-Reply-To: <20230912060824.5210-1-jose.pekkarinen@foxhound.fi>
References: <20230912060824.5210-1-jose.pekkarinen@foxhound.fi>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <36155537ca2f99762bde8bf23b3eb45f@foxhound.fi>
X-Sender: jose.pekkarinen@foxhound.fi
Organization: Foxhound Ltd.
X-Originating-IP: 185.220.102.251
X-Webmail-UserID: jose.pekkarinen@foxhound.fi
X-Ovh-Tracer-Id: 9370864926515504806
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedviedrudekuddgtdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpeggfffhvfevufgjfhgfkfigohhitgfgsehtkehjtddtreejnecuhfhrohhmpeflohhsrocurfgvkhhkrghrihhnvghnuceojhhoshgvrdhpvghkkhgrrhhinhgvnhesfhhogihhohhunhgurdhfiheqnecuggftrfgrthhtvghrnhepkefhgeduudefgedvleegtddvffeghedvtdekveekjeevvdegiedtfeelhedtiedtnecukfhppeduvdejrddtrddtrddupddukeehrddvvddtrddutddvrddvhedupddujeeirdefuddrvdefkedruddvtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehjohhsvgdrphgvkhhkrghrihhnvghnsehfohighhhouhhnugdrfhhiqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhdqmhgvnhhtvggvsheslhhishhtshdrlhhinhhugihfohhunhgurghtihhonhdrohhrghdpoffvtefjohhsthepmhhoheekvddpmhhouggvpehsmhhtphhouhht
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, olvaffe@gmail.com, daniel@ffwll.ch,
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

T24gMjAyMy0wOS0xMiAwOTowOCwgSm9zw6kgUGVra2FyaW5lbiB3cm90ZToKPiBUaGUgcmVtb3Zl
ZCBsaW5lIHByZXZlbnRzIHRoZSBmb2xsb3dpbmcgY2xlYW51cCBmdW5jdGlvbgo+IHRvIGV4ZWN1
dGUgYSBkbWFfZmVuY2VfcHV0IG9uIHRoZSBvdXRfZmVuY2UgdG8gZnJlZSBpdHMKPiBtZW1vcnks
IHByb2R1Y2luZyB0aGUgZm9sbG93aW5nIG91dHB1dCBpbiBrbWVtbGVhazoKPiAKPiB1bnJlZmVy
ZW5jZWQgb2JqZWN0IDB4ZmZmZjg4ODEyNmQ4ZWUwMCAoc2l6ZSAxMjgpOgo+ICAgY29tbSAia3dp
bl93YXlsYW5kIiwgcGlkIDk4MSwgamlmZmllcyA0Mjk1MzgwMjk2IChhZ2UgMzkwLjA2MHMpCj4g
ICBoZXggZHVtcCAoZmlyc3QgMzIgYnl0ZXMpOgo+ICAgICBjOCBhMSBjMiAyNyA4MSA4OCBmZiBm
ZiBlMCAxNCBhOSBjMCBmZiBmZiBmZiBmZiAgLi4uJy4uLi4uLi4uLi4uLgo+ICAgICAzMCAxYSBl
MSAyZSBhNiAwMCAwMCAwMCAyOCBmYyA1YiAxNyA4MSA4OCBmZiBmZiAgMC4uLi4uLi4oLlsuLi4u
Lgo+ICAgYmFja3RyYWNlOgo+ICAgICBbPDAwMDAwMDAwMTE2NTU2NjE+XSBrbWFsbG9jX3RyYWNl
KzB4MjYvMHhhMAo+ICAgICBbPDAwMDAwMDAwNTVmMTViODI+XSB2aXJ0aW9fZ3B1X2ZlbmNlX2Fs
bG9jKzB4NDcvMHhjMCBbdmlydGlvX2dwdV0KPiAgICAgWzwwMDAwMDAwMGZhNmQ5NmY5Pl0gdmly
dGlvX2dwdV9leGVjYnVmZmVyX2lvY3RsKzB4MWE4LzB4ODAwIAo+IFt2aXJ0aW9fZ3B1XQo+ICAg
ICBbPDAwMDAwMDAwZTZjYjUxMDU+XSBkcm1faW9jdGxfa2VybmVsKzB4MTY5LzB4MjQwIFtkcm1d
Cj4gICAgIFs8MDAwMDAwMDA1YWQzM2UyNz5dIGRybV9pb2N0bCsweDM5OS8weDZiMCBbZHJtXQo+
ICAgICBbPDAwMDAwMDAwYTE5ZGJmNjU+XSBfX3g2NF9zeXNfaW9jdGwrMHhjNS8weDEwMAo+ICAg
ICBbPDAwMDAwMDAwMTFmYTgwMWU+XSBkb19zeXNjYWxsXzY0KzB4NWIvMHhjMAo+ICAgICBbPDAw
MDAwMDAwNjVjNzZkOGE+XSBlbnRyeV9TWVNDQUxMXzY0X2FmdGVyX2h3ZnJhbWUrMHg2ZS8weGQ4
Cj4gdW5yZWZlcmVuY2VkIG9iamVjdCAweGZmZmY4ODgxMjE5MzA1MDAgKHNpemUgMTI4KToKPiAg
IGNvbW0gImt3aW5fd2F5bGFuZCIsIHBpZCA5ODEsIGppZmZpZXMgNDI5NTM4MDMxMyAoYWdlIDM5
MC4wOTZzKQo+ICAgaGV4IGR1bXAgKGZpcnN0IDMyIGJ5dGVzKToKPiAgICAgYzggYTEgYzIgMjcg
ODEgODggZmYgZmYgZTAgMTQgYTkgYzAgZmYgZmYgZmYgZmYgIC4uLicuLi4uLi4uLi4uLi4KPiAg
ICAgZjkgZWMgZDcgMmYgYTYgMDAgMDAgMDAgMjggZmMgNWIgMTcgODEgODggZmYgZmYgIC4uLi8u
Li4uKC5bLi4uLi4KPiAgIGJhY2t0cmFjZToKPiAgICAgWzwwMDAwMDAwMDExNjU1NjYxPl0ga21h
bGxvY190cmFjZSsweDI2LzB4YTAKPiAgICAgWzwwMDAwMDAwMDU1ZjE1YjgyPl0gdmlydGlvX2dw
dV9mZW5jZV9hbGxvYysweDQ3LzB4YzAgW3ZpcnRpb19ncHVdCj4gICAgIFs8MDAwMDAwMDBmYTZk
OTZmOT5dIHZpcnRpb19ncHVfZXhlY2J1ZmZlcl9pb2N0bCsweDFhOC8weDgwMCAKPiBbdmlydGlv
X2dwdV0KPiAgICAgWzwwMDAwMDAwMGU2Y2I1MTA1Pl0gZHJtX2lvY3RsX2tlcm5lbCsweDE2OS8w
eDI0MCBbZHJtXQo+ICAgICBbPDAwMDAwMDAwNWFkMzNlMjc+XSBkcm1faW9jdGwrMHgzOTkvMHg2
YjAgW2RybV0KPiAgICAgWzwwMDAwMDAwMGExOWRiZjY1Pl0gX194NjRfc3lzX2lvY3RsKzB4YzUv
MHgxMDAKPiAgICAgWzwwMDAwMDAwMDExZmE4MDFlPl0gZG9fc3lzY2FsbF82NCsweDViLzB4YzAK
PiAgICAgWzwwMDAwMDAwMDY1Yzc2ZDhhPl0gZW50cnlfU1lTQ0FMTF82NF9hZnRlcl9od2ZyYW1l
KzB4NmUvMHhkOAo+IFsuLi5dCj4gCj4gVGhpcyBtZW1sZWFrIHdpbGwgZ3JvdyBxdWlja2x5LCBi
ZWluZyBwb3NzaWJsZSB0byBzZWUgdGhlCj4gZm9sbG93aW5nIGxpbmUgaW4gZG1lc2cgYWZ0ZXIg
ZmV3IG1pbnV0ZXMgb2YgbGlmZSBpbiB0aGUKPiB2aXJ0dWFsIG1hY2hpbmU6Cj4gCj4gWyAgNzA2
LjIxNzM4OF0ga21lbWxlYWs6IDEwNzMxIG5ldyBzdXNwZWN0ZWQgbWVtb3J5IGxlYWtzIChzZWUK
PiAvc3lzL2tlcm5lbC9kZWJ1Zy9rbWVtbGVhaykKPiAKPiBUaGUgcGF0Y2ggd2lsbCByZW1vdmUg
dGhlIGxpbmUgdG8gYWxsb3cgdGhlIGNsZWFudXAKPiBmdW5jdGlvbiBkbyBpdHMgam9iLgo+IAo+
IFNpZ25lZC1vZmYtYnk6IEpvc8OpIFBla2thcmluZW4gPGpvc2UucGVra2FyaW5lbkBmb3hob3Vu
ZC5maT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X3N1Ym1pdC5jIHwg
MSAtCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9zdWJtaXQuYwo+IGIvZHJpdmVycy9ncHUvZHJt
L3ZpcnRpby92aXJ0Z3B1X3N1Ym1pdC5jCj4gaW5kZXggM2MwMDEzNWVhZDQ1Li41YzUxNDk0NmJi
YWQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X3N1Ym1pdC5j
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X3N1Ym1pdC5jCj4gQEAgLTM2
MSw3ICszNjEsNiBAQCBzdGF0aWMgdm9pZCB2aXJ0aW9fZ3B1X2NvbXBsZXRlX3N1Ym1pdChzdHJ1
Y3QKPiB2aXJ0aW9fZ3B1X3N1Ym1pdCAqc3VibWl0KQo+ICAJc3VibWl0LT5idWYgPSBOVUxMOwo+
ICAJc3VibWl0LT5idWZsaXN0ID0gTlVMTDsKPiAgCXN1Ym1pdC0+c3luY19maWxlID0gTlVMTDsK
PiAtCXN1Ym1pdC0+b3V0X2ZlbmNlID0gTlVMTDsKPiAgCXN1Ym1pdC0+b3V0X2ZlbmNlX2ZkID0g
LTE7Cj4gIH0KCiAgICAgUGluZy4KCiAgICAgSm9zw6kuCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWtlcm5lbC1tZW50ZWVzIG1haWxpbmcgbGlz
dApMaW51eC1rZXJuZWwtbWVudGVlc0BsaXN0cy5saW51eGZvdW5kYXRpb24ub3JnCmh0dHBzOi8v
bGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWtlcm5lbC1t
ZW50ZWVzCg==
