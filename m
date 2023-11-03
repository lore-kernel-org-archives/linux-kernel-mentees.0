Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3F77C4332F
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  3 Nov 2023 17:58:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B5A560A4F;
	Fri,  3 Nov 2023 17:58:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B5A560A4F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ULjth0_zz9kz; Fri,  3 Nov 2023 17:58:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 1AAA4608B7;
	Fri,  3 Nov 2023 17:58:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1AAA4608B7
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E741CC0039;
	Fri,  3 Nov 2023 17:58:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8348AC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  3 Nov 2023 17:58:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5ED1D60A4F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  3 Nov 2023 17:58:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5ED1D60A4F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IPfILQmM30ee
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  3 Nov 2023 17:58:35 +0000 (UTC)
Received: from 7.mo575.mail-out.ovh.net (7.mo575.mail-out.ovh.net
 [46.105.63.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 176E0608B7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  3 Nov 2023 17:58:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 176E0608B7
Received: from director7.ghost.mail-out.ovh.net (unknown [10.108.20.200])
 by mo575.mail-out.ovh.net (Postfix) with ESMTP id A8D2626BB4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  3 Nov 2023 17:49:40 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-82dz8 (unknown [10.110.103.73])
 by director7.ghost.mail-out.ovh.net (Postfix) with ESMTPS id DB2F21FD72;
 Fri,  3 Nov 2023 17:49:39 +0000 (UTC)
Received: from RCM-web8.webmail.mail.ovh.net ([151.80.29.22])
 by ghost-submission-6684bf9d7b-82dz8 with ESMTPSA
 id PTtTNLMyRWW9RwYAl2N2dw
 (envelope-from <jose.pekkarinen@foxhound.fi>); Fri, 03 Nov 2023 17:49:39 +0000
MIME-Version: 1.0
Date: Fri, 03 Nov 2023 19:49:39 +0200
From: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@foxhound.fi>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] drivers core: lookup sysfs power group before removal
In-Reply-To: <2023110139-dupe-snipping-5700@gregkh>
References: <20231101173627.2658-1-jose.pekkarinen@foxhound.fi>
 <2023110139-dupe-snipping-5700@gregkh>
User-Agent: Roundcube Webmail/1.4.15
Message-ID: <835b2930c710381b8da38eca821aa92d@foxhound.fi>
X-Sender: jose.pekkarinen@foxhound.fi
Organization: Foxhound Ltd.
X-Originating-IP: 163.172.213.212
X-Webmail-UserID: jose.pekkarinen@foxhound.fi
X-Ovh-Tracer-Id: 3653545197961848323
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedruddtkedguddtgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeggfffhvfevufgjfhgfkfigohhitgfgsehtkehjtddtreejnecuhfhrohhmpeflohhsrocurfgvkhhkrghrihhnvghnuceojhhoshgvrdhpvghkkhgrrhhinhgvnhesfhhogihhohhunhgurdhfiheqnecuggftrfgrthhtvghrnhepkefhgeduudefgedvleegtddvffeghedvtdekveekjeevvdegiedtfeelhedtiedtnecukfhppeduvdejrddtrddtrddupdduieefrddujedvrddvudefrddvuddvpdduhedurdektddrvdelrddvvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehjohhsvgdrphgvkhhkrghrihhnvghnsehfohighhhouhhnugdrfhhiqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhdqmhgvnhhtvggvsheslhhishhtshdrlhhinhhugihfohhunhgurghtihhonhdrohhrghdpoffvtefjohhsthepmhhoheejhedpmhhouggvpehsmhhtphhouhht
Cc: len.brown@intel.com, linux-pm@vger.kernel.org, rafael@kernel.org,
 linux-kernel@vger.kernel.org,
 syzbot+95f2e2439b97575ec3c0@syzkaller.appspotmail.com, pavel@ucw.cz,
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

T24gMjAyMy0xMS0wMSAxOTo1NCwgR3JlZyBLSCB3cm90ZToKPiBPbiBXZWQsIE5vdiAwMSwgMjAy
MyBhdCAwNzozNjoyN1BNICswMjAwLCBKb3PDqSBQZWtrYXJpbmVuIHdyb3RlOgo+PiBIaW50ZWQg
Ynkgc3l6Ym9vdCwgdGhlcmUgaXMgYSBmZXcgY2FzZXMgd2hlcmUgdGhlIHN5c2ZzIHBvd2VyIGdy
b3VwIAo+PiBtYXkKPj4gbm90IGJlIHRoZXJlLCBsaWtlIHRoZSBmYWlsdXJlIHdoaWxlIGFkZGlu
ZyBpdCwgb3IgYWRkaW5nIGl0cyBydW50aW1lCj4+IGdyb3VwLCBvciB3aGVuIHRoZSBzeXNmcyBm
aXJtd2FyZSBsb2FkZXIgZmFsbGJhY2sgZmFpbCB0byBwb3B1bGF0ZS4gSW4KPj4gdGhlIGxhc3Qg
Y2FzZSwgdGhlIGRldmljZV9kZWwgZnVuY3Rpb24gd2lsbCBiZSBjYWxsZWQgbGVhZGluZyB0byAK
Pj4gYXR0ZW1wdAo+PiB0byByZW1vdmUgdGhlIHN5c2ZzIGdyb3VwLiBUaGlzIHBhdGNoIHdpbGwg
bG9va3VwIGZvciBpdCBpbiBhZHZhbmNlIHRvCj4+IGdyYW50IHRoYXQgaXQgaXMgZWZmZWN0aXZl
bHkgdGhlcmUgYmVmb3JlIGNsZWFuaW5nIGl0IHVwLgo+PiAKPj4gUmVwb3J0ZWQtYnk6IHN5emJv
dCs5NWYyZTI0MzliOTc1NzVlYzNjMEBzeXprYWxsZXIuYXBwc3BvdG1haWwuY29tCj4+IAo+PiBT
aWduZWQtb2ZmLWJ5OiBKb3PDqSBQZWtrYXJpbmVuIDxqb3NlLnBla2thcmluZW5AZm94aG91bmQu
Zmk+Cj4+IC0tLQo+PiAgZHJpdmVycy9iYXNlL3Bvd2VyL3N5c2ZzLmMgfCA0ICsrKy0KPj4gIDEg
ZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPj4gCj4+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2Jhc2UvcG93ZXIvc3lzZnMuYyBiL2RyaXZlcnMvYmFzZS9wb3dlci9z
eXNmcy5jCj4+IGluZGV4IGExNDc0ZmI2N2RiOS4uNjYwMTcyOWM0Njk4IDEwMDY0NAo+PiAtLS0g
YS9kcml2ZXJzL2Jhc2UvcG93ZXIvc3lzZnMuYwo+PiArKysgYi9kcml2ZXJzL2Jhc2UvcG93ZXIv
c3lzZnMuYwo+PiBAQCAtODM0LDUgKzgzNCw3IEBAIHZvaWQgZHBtX3N5c2ZzX3JlbW92ZShzdHJ1
Y3QgZGV2aWNlICpkZXYpCj4+ICAJZGV2X3BtX3Fvc19jb25zdHJhaW50c19kZXN0cm95KGRldik7
Cj4+ICAJcnBtX3N5c2ZzX3JlbW92ZShkZXYpOwo+PiAgCXN5c2ZzX3VubWVyZ2VfZ3JvdXAoJmRl
di0+a29iaiwgJnBtX3dha2V1cF9hdHRyX2dyb3VwKTsKPj4gLQlzeXNmc19yZW1vdmVfZ3JvdXAo
JmRldi0+a29iaiwgJnBtX2F0dHJfZ3JvdXApOwo+PiArCj4+ICsJaWYgKGtlcm5mc19maW5kX2Fu
ZF9nZXQoKCZkZXYtPmtvYmopLT5zZCwgcG1fYXR0cl9ncm91cC5uYW1lKSkKPj4gKwkJc3lzZnNf
cmVtb3ZlX2dyb3VwKCZkZXYtPmtvYmosICZwbV9hdHRyX2dyb3VwKTsKPiAKPiBXaGF0J3MgdG8g
a2VlcCBpdCBmcm9tIGdvaW5nIGF3YXkgcmlnaHQgYWZ0ZXIgZmluZGluZyBpdD8KPiAKPiBJbiBv
dGhlciB3b3Jkcywgd2hhdCBpcyB3cm9uZyB3aXRoIHJlbW92aW5nIGEgZ3JvdXAgdGhhdCBpcyBu
b3QgdGhlcmU/Cj4gV2hhdCBlcnJvciBoYXBwZW5zPyAgSXQgc2hvdWxkIGJlIGZpbmUsIG9yIGFy
ZSB5b3Ugc2VlaW5nIHJlYWwgY29kZQo+IGZhaWx1cmVzIHNvbWV3aGVyZT8KCiAgICAgTm8sIHRo
aXMgaXMganVzdCBoaXR0aW5nIGEgd2FybmluZyB0aGF0IHN5c2JvdCBjb21wbGFpbnMgYWJvdXQg
YnkKc2V0dGluZyBwYW5pYyBvbiB3YXJuaW5nLCBubyBiaWcgZGVhbCwgdGhvdWdoIGl0IGNhbiBi
ZSBhIHdyb25nIApiZWhhdmlvdXIKaW4gdWVhZ2xlLWF0bSBkcml2ZXIsIHNpbmNlIGl0IGRlZmlu
ZXMgdG8gZGlzY29ubmVjdCB0aGUgZGV2aWNlIGlmIHRoZQpmaXJtd2FyZSBpcyBub3QgdGhlcmUs
IG5vIG1hdHRlciB0aGUgc3lzZnMgZmFsbGJhY2suCgo+IEFsc28sIEkgdGhpbmsgeW91IGp1c3Qg
bGVha2VkIGEgcmVmZXJlbmNlIGNvdW50IGhlcmUsIGhvdyB3YXMgdGhpcwo+IHRlc3RlZD8KCiAg
ICAgQm90aCBieSBzZXR0aW5nIHVwIGEgbG9jYWwgdm0gZm9sbG93aW5nIHN5emthbGxlciBpbnN0
cnVjdGlvbnMgYW5kCnVzaW5nIHRoZSBzeXprYWxsZXIgaXRzZWxmIHRvIHRlc3QgaXQuIFlvdSBj
YW4gdGFrZSBhIGxvb2sgaW4gdGhlIGxpbmsKaWYgeW91IGZlZWwgbGlrZSBpdC4KCiAgICAgSm9z
w6kuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LWtlcm5lbC1tZW50ZWVzIG1haWxpbmcgbGlzdApMaW51eC1rZXJuZWwtbWVudGVlc0BsaXN0cy5s
aW51eGZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LWtlcm5lbC1tZW50ZWVzCg==
