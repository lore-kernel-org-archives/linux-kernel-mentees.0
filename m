Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DE84CD80B7
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 10 Oct 2023 12:02:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A5B944098F;
	Tue, 10 Oct 2023 12:02:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A5B944098F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3CY0XoTNFRiJ; Tue, 10 Oct 2023 12:02:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 90831405CF;
	Tue, 10 Oct 2023 12:02:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 90831405CF
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 72367C0071;
	Tue, 10 Oct 2023 12:02:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 17784C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Oct 2023 12:02:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E52F9408AE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Oct 2023 12:02:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E52F9408AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GloCnffu2wGw
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Oct 2023 12:02:00 +0000 (UTC)
Received: from 9.mo581.mail-out.ovh.net (9.mo581.mail-out.ovh.net
 [46.105.60.248])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 970A0408A6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Oct 2023 12:02:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 970A0408A6
Received: from director11.ghost.mail-out.ovh.net (unknown [10.108.20.113])
 by mo581.mail-out.ovh.net (Postfix) with ESMTP id 441F828784
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Oct 2023 12:01:58 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-x96xs (unknown [10.111.172.101])
 by director11.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 71EFA1FEDD;
 Tue, 10 Oct 2023 12:01:57 +0000 (UTC)
Received: from RCM-web10.webmail.mail.ovh.net ([151.80.29.18])
 by ghost-submission-6684bf9d7b-x96xs with ESMTPSA
 id PiQoGDU9JWXNqgAAoY8iwA
 (envelope-from <jose.pekkarinen@foxhound.fi>); Tue, 10 Oct 2023 12:01:57 +0000
MIME-Version: 1.0
Date: Tue, 10 Oct 2023 15:01:56 +0300
From: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@foxhound.fi>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] kvm/sev: make SEV/SEV-ES asids configurable
In-Reply-To: <2023101050-scuff-overstay-9b43@gregkh>
References: <20231010100441.30950-1-jose.pekkarinen@foxhound.fi>
 <2023101050-scuff-overstay-9b43@gregkh>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <f4713760f799766717b5a4128e63e135@foxhound.fi>
X-Sender: jose.pekkarinen@foxhound.fi
Organization: Foxhound Ltd.
X-Originating-IP: 185.233.100.23
X-Webmail-UserID: jose.pekkarinen@foxhound.fi
X-Ovh-Tracer-Id: 4410712886810617510
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedrheehgdegiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeggfffhvfevufgjfhgfkfigohhitgfgsehtkehjtddtreejnecuhfhrohhmpeflohhsrocurfgvkhhkrghrihhnvghnuceojhhoshgvrdhpvghkkhgrrhhinhgvnhesfhhogihhohhunhgurdhfiheqnecuggftrfgrthhtvghrnhepkefhgeduudefgedvleegtddvffeghedvtdekveekjeevvdegiedtfeelhedtiedtnecukfhppeduvdejrddtrddtrddupddukeehrddvfeefrddutddtrddvfedpudehuddrkedtrddvledrudeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeojhhoshgvrdhpvghkkhgrrhhinhgvnhesfhhogihhohhunhgurdhfiheqpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlqdhmvghnthgvvghssehlihhsthhsrdhlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdfovfetjfhoshhtpehmohehkedupdhmohguvgepshhmthhpohhuth
Cc: x86@kernel.org, hpa@zytor.com, kvm@vger.kernel.org, seanjc@google.com,
 dave.hansen@linux.intel.com, linux-kernel@vger.kernel.org, mingo@redhat.com,
 bp@alien8.de, pbonzini@redhat.com, tglx@linutronix.de,
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

T24gMjAyMy0xMC0xMCAxNDozNSwgR3JlZyBLSCB3cm90ZToKPiBPbiBUdWUsIE9jdCAxMCwgMjAy
MyBhdCAwMTowNDozOVBNICswMzAwLCBKb3PDqSBQZWtrYXJpbmVuIHdyb3RlOgo+PiBUaGVyZSBh
cmUgYmlvc2VzIHRoYXQgZG9lc24ndCBhbGxvdyB0byBjb25maWd1cmUgdGhlCj4+IG51bWJlciBv
ZiBhc2lkcyBhbGxvY2F0ZWQgZm9yIFNFVi9TRVYtRVMsIGZvciB0aG9zZQo+PiBjYXNlcywgdGhl
IGRlZmF1bHQgYmVoYXZpb3VyIGFsbG9jYXRlcyBhbGwgdGhlIGFzaWRzCj4+IGZvciBTRVYsIGxl
YXZpbmcgbm8gcm9vbSBmb3IgU0VWLUVTIHRvIGhhdmUgc29tZSBmdW4uCj4gCj4gImZ1biI/Cj4g
Cj4gQWxzbywgcGxlYXNlIHVzZSB0aGUgZnVsbCA3MiBjb2x1bW5zIGZvciB5b3VyIGNoYW5nZWxv
Zy4KPiAKCiAgICAgQWxyaWdodC4KCj4+IElmIHRoZSB1c2VyIHJlcXVlc3QgU0VWLUVTIHRvIGJl
IGVuYWJsZWQsIGl0IHdpbGwKPj4gZmluZCB0aGUga2VybmVsIGp1c3QgcnVuIG91dCBvZiByZXNv
dXJjZXMgYW5kIGlnbm9yZWQKPj4gdXNlciByZXF1ZXN0LiBUaGlzIGZvbGxvd2luZyBwYXRjaCB3
aWxsIGFkZHJlc3MgdGhpcwo+PiBpc3N1ZSBieSBtYWtpbmcgdGhlIG51bWJlciBvZiBhc2lkcyBm
b3IgU0VWL1NFVi1FUwo+PiBjb25maWd1cmFibGUgb3ZlciBrZXJuZWwgbW9kdWxlIHBhcmFtZXRl
cnMuCj4+IAo+PiBTaWduZWQtb2ZmLWJ5OiBKb3PDqSBQZWtrYXJpbmVuIDxqb3NlLnBla2thcmlu
ZW5AZm94aG91bmQuZmk+Cj4+IC0tLQo+PiAgYXJjaC94ODYva3ZtL3N2bS9zZXYuYyB8IDI4ICsr
KysrKysrKysrKysrKysrKysrKysrLS0tLS0KPj4gIDEgZmlsZSBjaGFuZ2VkLCAyMyBpbnNlcnRp
b25zKCspLCA1IGRlbGV0aW9ucygtKQo+PiAKPj4gZGlmZiAtLWdpdCBhL2FyY2gveDg2L2t2bS9z
dm0vc2V2LmMgYi9hcmNoL3g4Ni9rdm0vc3ZtL3Nldi5jCj4+IGluZGV4IDA3NzU2YjczNDhhZS4u
NjhhNjNiNDJkMTZhIDEwMDY0NAo+PiAtLS0gYS9hcmNoL3g4Ni9rdm0vc3ZtL3Nldi5jCj4+ICsr
KyBiL2FyY2gveDg2L2t2bS9zdm0vc2V2LmMKPj4gQEAgLTUxLDkgKzUxLDE4IEBACj4+ICBzdGF0
aWMgYm9vbCBzZXZfZW5hYmxlZCA9IHRydWU7Cj4+ICBtb2R1bGVfcGFyYW1fbmFtZWQoc2V2LCBz
ZXZfZW5hYmxlZCwgYm9vbCwgMDQ0NCk7Cj4+IAo+PiArLyogbnIgb2YgYXNpZHMgcmVxdWVzdGVk
IGZvciBTRVYgKi8KPj4gK3N0YXRpYyB1bnNpZ25lZCBpbnQgcmVxdWVzdGVkX3Nldl9hc2lkczsK
Pj4gK21vZHVsZV9wYXJhbV9uYW1lZChzZXZfYXNpZHMsIHJlcXVlc3RlZF9zZXZfYXNpZHMsIHVp
bnQsIDA0NDQpOwo+PiArCj4+ICAvKiBlbmFibGUvZGlzYWJsZSBTRVYtRVMgc3VwcG9ydCAqLwo+
PiAgc3RhdGljIGJvb2wgc2V2X2VzX2VuYWJsZWQgPSB0cnVlOwo+PiAgbW9kdWxlX3BhcmFtX25h
bWVkKHNldl9lcywgc2V2X2VzX2VuYWJsZWQsIGJvb2wsIDA0NDQpOwo+PiArCj4+ICsvKiBuciBv
ZiBhc2lkcyByZXF1ZXN0ZWQgZm9yIFNFVi1FUyAqLwo+PiArc3RhdGljIHVuc2lnbmVkIGludCBy
ZXF1ZXN0ZWRfc2V2X2VzX2FzaWRzOwo+PiArbW9kdWxlX3BhcmFtX25hbWVkKHNldl9lc19hc2lk
cywgcmVxdWVzdGVkX3Nldl9hc2lkcywgdWludCwgMDQ0NCk7Cj4gCj4gV2h5IG1vcmUgbW9kdWxl
IHBhcmFtZXRlcnM/ICBXaHkgY2FuJ3QgdGhpcyAianVzdCB3b3JrIiBwcm9wZXJseSAKPiB3aXRo
b3V0Cj4gZm9yY2luZyBhIHVzZXIgdG8gbWFrZSBtYW51YWwgY2hhbmdlcz8gIFRoaXMgaXNuJ3Qg
dGhlIDE5OTAncyBhbnltb3JlLgoKICAgICBJIGNvdWxkIHRoaW5rIG9mIHNldHRpbmcgYm90aCBj
Z3JvdXAgY2FwcyB0byB0aGUgbWF4aW11bQpudW1iZXIgb2YgYXNpZHMgYW5kIHRoZW4gY2hlY2sg
dGhlIGNvZGUgaW4gdGhlIG1vZHVsZSB0byBtYWtlCnN1cmUgYW55dGltZSBhIHNldi9zZXZfZXMg
YXNpZCBpcyByZXNlcnZlZCBib3RoIGNncm91cHMgZ2V0CnVwZGF0ZWQgdG8gcmVmbGVjdCB0aGUg
cmVtYWluaW5nIGFzaWRzLCBvciBldmVuIGJldHRlciwganVzdAp1c2Ugb25seSBvbmUgY2dyb3Vw
IHRvIGtlZXAgdHJhY2sgb2YgdGhlbS4gVGhhdCB3YXkgdGhlIHBhcmFtZXRlcnMKYmVjb21lIHJl
ZHVuZGFudCwgd291bGQgYW55IG9mIHRoZXNlIGlkZWFzIHdvcmsgZm9yIHlvdT8gRG8geW91LApv
ciBhbnlib2R5IGVsc2UsIGhhdmUgYmV0dGVyIGlkZWFzIG9yIHByZWZlcmVuY2VzIGluIHRoaXMg
dG9waWM/Cgo+PiArCj4+ICAjZWxzZQo+PiAgI2RlZmluZSBzZXZfZW5hYmxlZCBmYWxzZQo+PiAg
I2RlZmluZSBzZXZfZXNfZW5hYmxlZCBmYWxzZQo+PiBAQCAtMjE5NCw2ICsyMjAzLDExIEBAIHZv
aWQgX19pbml0IHNldl9oYXJkd2FyZV9zZXR1cCh2b2lkKQo+PiAgCWlmICghbWF4X3Nldl9hc2lk
KQo+PiAgCQlnb3RvIG91dDsKPj4gCj4+ICsJaWYgKHJlcXVlc3RlZF9zZXZfYXNpZHMgKyByZXF1
ZXN0ZWRfc2V2X2VzX2FzaWRzID4gbWF4X3Nldl9hc2lkKSB7Cj4+ICsJCXByX2luZm8oIlNFViBh
c2lkcyByZXF1ZXN0ZWQgbW9yZSB0aGFuIGF2YWlsYWJsZTogJXUgQVNJRHNcbiIsIAo+PiBtYXhf
c2V2X2FzaWQpOwo+IAo+IFdoeSBpc24ndCB0aGlzIGFuIGVycm9yPwoKICAgICBHb29kIHF1ZXN0
aW9uLCBJJ2xsIGFkZHJlc3MgaXQgaW4gdjIuCgogICAgIFRoYW5rcyEKCiAgICAgSm9zw6kuCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWtlcm5l
bC1tZW50ZWVzIG1haWxpbmcgbGlzdApMaW51eC1rZXJuZWwtbWVudGVlc0BsaXN0cy5saW51eGZv
dW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LWtlcm5lbC1tZW50ZWVzCg==
