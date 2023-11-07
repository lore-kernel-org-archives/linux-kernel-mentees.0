Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E380CC4332F
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  7 Nov 2023 09:02:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F3B061396;
	Tue,  7 Nov 2023 09:02:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F3B061396
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o_TvsSRkodmG; Tue,  7 Nov 2023 09:02:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 604BE61320;
	Tue,  7 Nov 2023 09:02:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 604BE61320
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 381DAC0071;
	Tue,  7 Nov 2023 09:02:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 01817C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Nov 2023 09:02:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CD5F361392
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Nov 2023 09:02:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD5F361392
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iafOaJXFySRT
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Nov 2023 09:02:15 +0000 (UTC)
Received: from 8.mo560.mail-out.ovh.net (8.mo560.mail-out.ovh.net
 [188.165.52.147])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7E10961320
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Nov 2023 09:02:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E10961320
Received: from director9.ghost.mail-out.ovh.net (unknown [10.108.4.127])
 by mo560.mail-out.ovh.net (Postfix) with ESMTP id 4DC892A29E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Nov 2023 08:56:21 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-xtvm8 (unknown [10.110.103.4])
 by director9.ghost.mail-out.ovh.net (Postfix) with ESMTPS id DF8911FE4C;
 Tue,  7 Nov 2023 08:56:20 +0000 (UTC)
Received: from RCM-web8.webmail.mail.ovh.net ([151.80.29.22])
 by ghost-submission-6684bf9d7b-xtvm8 with ESMTPSA
 id 5ldYNbT7SWV8SwAAy7z86g
 (envelope-from <jose.pekkarinen@foxhound.fi>); Tue, 07 Nov 2023 08:56:20 +0000
MIME-Version: 1.0
Date: Tue, 07 Nov 2023 10:56:20 +0200
From: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@foxhound.fi>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] drivers core: lookup sysfs power group before removal
In-Reply-To: <2023110353-bring-contented-c9f8@gregkh>
References: <20231101173627.2658-1-jose.pekkarinen@foxhound.fi>
 <2023110139-dupe-snipping-5700@gregkh>
 <835b2930c710381b8da38eca821aa92d@foxhound.fi>
 <2023110353-bring-contented-c9f8@gregkh>
User-Agent: Roundcube Webmail/1.4.15
Message-ID: <e13104c9e55b0bd8eee0a333b3ed7975@foxhound.fi>
X-Sender: jose.pekkarinen@foxhound.fi
Organization: Foxhound Ltd.
X-Originating-IP: 91.132.144.59
X-Webmail-UserID: jose.pekkarinen@foxhound.fi
X-Ovh-Tracer-Id: 18137403077422261763
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedrudduhedguddvvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeggfffhvfevufgjfhgfkfigohhitgfgsehtkehjtddtreejnecuhfhrohhmpeflohhsrocurfgvkhhkrghrihhnvghnuceojhhoshgvrdhpvghkkhgrrhhinhgvnhesfhhogihhohhunhgurdhfiheqnecuggftrfgrthhtvghrnhepkefhgeduudefgedvleegtddvffeghedvtdekveekjeevvdegiedtfeelhedtiedtnecukfhppeduvdejrddtrddtrddupdeluddrudefvddrudeggedrheelpdduhedurdektddrvdelrddvvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehjohhsvgdrphgvkhhkrghrihhnvghnsehfohighhhouhhnugdrfhhiqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhdqmhgvnhhtvggvsheslhhishhtshdrlhhinhhugihfohhunhgurghtihhonhdrohhrghdpoffvtefjohhsthepmhhoheeitddpmhhouggvpehsmhhtphhouhht
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

T24gMjAyMy0xMS0wMyAyMDozNiwgR3JlZyBLSCB3cm90ZToKPiBPbiBGcmksIE5vdiAwMywgMjAy
MyBhdCAwNzo0OTozOVBNICswMjAwLCBKb3PDqSBQZWtrYXJpbmVuIHdyb3RlOgo+PiBPbiAyMDIz
LTExLTAxIDE5OjU0LCBHcmVnIEtIIHdyb3RlOgo+PiA+IE9uIFdlZCwgTm92IDAxLCAyMDIzIGF0
IDA3OjM2OjI3UE0gKzAyMDAsIEpvc8OpIFBla2thcmluZW4gd3JvdGU6Cj4+ID4gPiBIaW50ZWQg
Ynkgc3l6Ym9vdCwgdGhlcmUgaXMgYSBmZXcgY2FzZXMgd2hlcmUgdGhlIHN5c2ZzIHBvd2VyIGdy
b3VwCj4+ID4gPiBtYXkKPj4gPiA+IG5vdCBiZSB0aGVyZSwgbGlrZSB0aGUgZmFpbHVyZSB3aGls
ZSBhZGRpbmcgaXQsIG9yIGFkZGluZyBpdHMgcnVudGltZQo+PiA+ID4gZ3JvdXAsIG9yIHdoZW4g
dGhlIHN5c2ZzIGZpcm13YXJlIGxvYWRlciBmYWxsYmFjayBmYWlsIHRvIHBvcHVsYXRlLiBJbgo+
PiA+ID4gdGhlIGxhc3QgY2FzZSwgdGhlIGRldmljZV9kZWwgZnVuY3Rpb24gd2lsbCBiZSBjYWxs
ZWQgbGVhZGluZyB0bwo+PiA+ID4gYXR0ZW1wdAo+PiA+ID4gdG8gcmVtb3ZlIHRoZSBzeXNmcyBn
cm91cC4gVGhpcyBwYXRjaCB3aWxsIGxvb2t1cCBmb3IgaXQgaW4gYWR2YW5jZSB0bwo+PiA+ID4g
Z3JhbnQgdGhhdCBpdCBpcyBlZmZlY3RpdmVseSB0aGVyZSBiZWZvcmUgY2xlYW5pbmcgaXQgdXAu
Cj4+ID4gPgo+PiA+ID4gUmVwb3J0ZWQtYnk6IHN5emJvdCs5NWYyZTI0MzliOTc1NzVlYzNjMEBz
eXprYWxsZXIuYXBwc3BvdG1haWwuY29tCj4+ID4gPgo+PiA+ID4gU2lnbmVkLW9mZi1ieTogSm9z
w6kgUGVra2FyaW5lbiA8am9zZS5wZWtrYXJpbmVuQGZveGhvdW5kLmZpPgo+PiA+ID4gLS0tCj4+
ID4gPiAgZHJpdmVycy9iYXNlL3Bvd2VyL3N5c2ZzLmMgfCA0ICsrKy0KPj4gPiA+ICAxIGZpbGUg
Y2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+ID4gPgo+PiA+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvYmFzZS9wb3dlci9zeXNmcy5jIGIvZHJpdmVycy9iYXNlL3Bvd2Vy
L3N5c2ZzLmMKPj4gPiA+IGluZGV4IGExNDc0ZmI2N2RiOS4uNjYwMTcyOWM0Njk4IDEwMDY0NAo+
PiA+ID4gLS0tIGEvZHJpdmVycy9iYXNlL3Bvd2VyL3N5c2ZzLmMKPj4gPiA+ICsrKyBiL2RyaXZl
cnMvYmFzZS9wb3dlci9zeXNmcy5jCj4+ID4gPiBAQCAtODM0LDUgKzgzNCw3IEBAIHZvaWQgZHBt
X3N5c2ZzX3JlbW92ZShzdHJ1Y3QgZGV2aWNlICpkZXYpCj4+ID4gPiAgCWRldl9wbV9xb3NfY29u
c3RyYWludHNfZGVzdHJveShkZXYpOwo+PiA+ID4gIAlycG1fc3lzZnNfcmVtb3ZlKGRldik7Cj4+
ID4gPiAgCXN5c2ZzX3VubWVyZ2VfZ3JvdXAoJmRldi0+a29iaiwgJnBtX3dha2V1cF9hdHRyX2dy
b3VwKTsKPj4gPiA+IC0Jc3lzZnNfcmVtb3ZlX2dyb3VwKCZkZXYtPmtvYmosICZwbV9hdHRyX2dy
b3VwKTsKPj4gPiA+ICsKPj4gPiA+ICsJaWYgKGtlcm5mc19maW5kX2FuZF9nZXQoKCZkZXYtPmtv
YmopLT5zZCwgcG1fYXR0cl9ncm91cC5uYW1lKSkKPj4gPiA+ICsJCXN5c2ZzX3JlbW92ZV9ncm91
cCgmZGV2LT5rb2JqLCAmcG1fYXR0cl9ncm91cCk7Cj4+ID4KPj4gPiBXaGF0J3MgdG8ga2VlcCBp
dCBmcm9tIGdvaW5nIGF3YXkgcmlnaHQgYWZ0ZXIgZmluZGluZyBpdD8KPj4gPgo+PiA+IEluIG90
aGVyIHdvcmRzLCB3aGF0IGlzIHdyb25nIHdpdGggcmVtb3ZpbmcgYSBncm91cCB0aGF0IGlzIG5v
dCB0aGVyZT8KPj4gPiBXaGF0IGVycm9yIGhhcHBlbnM/ICBJdCBzaG91bGQgYmUgZmluZSwgb3Ig
YXJlIHlvdSBzZWVpbmcgcmVhbCBjb2RlCj4+ID4gZmFpbHVyZXMgc29tZXdoZXJlPwo+PiAKPj4g
ICAgIE5vLCB0aGlzIGlzIGp1c3QgaGl0dGluZyBhIHdhcm5pbmcgdGhhdCBzeXNib3QgY29tcGxh
aW5zIGFib3V0IGJ5Cj4+IHNldHRpbmcgcGFuaWMgb24gd2FybmluZywgbm8gYmlnIGRlYWwsIHRo
b3VnaCBpdCBjYW4gYmUgYSB3cm9uZyAKPj4gYmVoYXZpb3VyCj4+IGluIHVlYWdsZS1hdG0gZHJp
dmVyLCBzaW5jZSBpdCBkZWZpbmVzIHRvIGRpc2Nvbm5lY3QgdGhlIGRldmljZSBpZiB0aGUKPj4g
ZmlybXdhcmUgaXMgbm90IHRoZXJlLCBubyBtYXR0ZXIgdGhlIHN5c2ZzIGZhbGxiYWNrLgo+IAo+
IFRoZW4gZml4IHRoZSBkcml2ZXIgcGxlYXNlLgoKICAgICBJJ20gYWZyYWlkIEkgd2FzIHdyb25n
IGluIHRoZSBhc3N1bXB0aW9uIHRoYXQgdGhlIHByb2JlIHJldHVybiB2YWx1ZQpvZiB0aGUgZHJp
dmVyIHdvdWxkIGluZmx1ZW5jZSB0aGUgdGVzdGluZyByZXN1bHQsIHNvIHRoaXMgbm8gbG9uZ2Vy
IApzZWVtcwpmaXhhYmxlIGZyb20gZHJpdmVyIHNpZGUuIEl0IG1heSBiZSBmaXhlZCBoZXJlIGlu
IHRoZSBiYXNlLCBpbiB0aGUgc3lzZnMKb3Igbm90IHRvIGZpeCBpdCBhdCBhbGwgc2luY2UgdGhp
cyBzZWVtIHRvIGJlIGEgdmVyeSBkaWZmaWN1bHQgdG8gcmVhY2gKc2l0dWF0aW9uLiBJJ20gZmlu
ZSB3aXRoIGFueSBhcHByb2FjaCwgYW5kIEkgY2FuIGRvIHRoZSB3b3JrLCBJJ2QganVzdApsaWtl
IHRvIHJlYWQgd2hhdCBhcmUgeW91ciBwcmVmZXJlbmNlcyBvbiB0aGUgdG9waWMuCgogICAgIFRo
YW5rcyEKCiAgICAgSm9zw6kuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LWtlcm5lbC1tZW50ZWVzIG1haWxpbmcgbGlzdApMaW51eC1rZXJuZWwt
bWVudGVlc0BsaXN0cy5saW51eGZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3Vu
ZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWtlcm5lbC1tZW50ZWVzCg==
