Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09455CDB482
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 12 Oct 2023 19:11:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A68D4610A0;
	Thu, 12 Oct 2023 19:11:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A68D4610A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 16i7PzMS7Umi; Thu, 12 Oct 2023 19:11:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 8F77760644;
	Thu, 12 Oct 2023 19:11:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F77760644
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 61DB4C0071;
	Thu, 12 Oct 2023 19:11:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E592BC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Oct 2023 19:11:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AC5FC81D7D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Oct 2023 19:11:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC5FC81D7D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kY8IbthgQGqw
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Oct 2023 19:11:06 +0000 (UTC)
X-Greylist: delayed 6603 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 12 Oct 2023 19:11:06 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B52281E18
Received: from 6.mo583.mail-out.ovh.net (6.mo583.mail-out.ovh.net
 [178.32.119.138])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5B52281E18
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Oct 2023 19:11:06 +0000 (UTC)
Received: from director9.ghost.mail-out.ovh.net (unknown [10.108.4.60])
 by mo583.mail-out.ovh.net (Postfix) with ESMTP id 451DB29833
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Oct 2023 16:45:31 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-jv9cr (unknown [10.110.103.4])
 by director9.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 6E6861FE1E;
 Thu, 12 Oct 2023 16:45:30 +0000 (UTC)
Received: from RCM-web5.webmail.mail.ovh.net ([51.255.71.60])
 by ghost-submission-6684bf9d7b-jv9cr with ESMTPSA
 id +UL6GaoiKGWgTgEAl0SSeQ
 (envelope-from <jose.pekkarinen@foxhound.fi>); Thu, 12 Oct 2023 16:45:30 +0000
MIME-Version: 1.0
Date: Thu, 12 Oct 2023 16:45:30 +0000
From: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@foxhound.fi>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] kvm/sev: remove redundant MISC_CG_RES_SEV_ES
In-Reply-To: <9faf1a1a-af49-5f6f-9f33-6cf57f884c44@redhat.com>
References: <20231010174932.29769-1-jose.pekkarinen@foxhound.fi>
 <9faf1a1a-af49-5f6f-9f33-6cf57f884c44@redhat.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <6a777c72a6dc15ad80ecbedd4c6c35d9@foxhound.fi>
X-Sender: jose.pekkarinen@foxhound.fi
Organization: Foxhound Ltd.
X-Originating-IP: 109.70.100.71
X-Webmail-UserID: jose.pekkarinen@foxhound.fi
X-Ovh-Tracer-Id: 2497808946033305254
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedriedtgdelgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeggfffhvfevufgjfhgfkfigohhitgfgsehtkehjtddtreejnecuhfhrohhmpeflohhsrocurfgvkhhkrghrihhnvghnuceojhhoshgvrdhpvghkkhgrrhhinhgvnhesfhhogihhohhunhgurdhfiheqnecuggftrfgrthhtvghrnhepkefhgeduudefgedvleegtddvffeghedvtdekveekjeevvdegiedtfeelhedtiedtnecukfhppeduvdejrddtrddtrddupddutdelrdejtddruddttddrjedupdehuddrvdehhedrjedurdeitdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehjohhsvgdrphgvkhhkrghrihhnvghnsehfohighhhouhhnugdrfhhiqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhdqmhgvnhhtvggvsheslhhishhtshdrlhhinhhugihfohhunhgurghtihhonhdrohhrghdpoffvtefjohhsthepmhhoheekfedpmhhouggvpehsmhhtphhouhht
Cc: x86@kernel.org, hpa@zytor.com, kvm@vger.kernel.org, seanjc@google.com,
 dave.hansen@linux.intel.com, linux-kernel@vger.kernel.org, mingo@redhat.com,
 bp@alien8.de, tglx@linutronix.de,
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

T24gMjAyMy0xMC0xMiAxMzo0MywgUGFvbG8gQm9uemluaSB3cm90ZToKPiBPbiAxMC8xMC8yMyAx
OTo0OSwgSm9zw6kgUGVra2FyaW5lbiB3cm90ZToKPj4gU0VWLUVTIGlzIGFuIGV4dHJhIGVuY3J5
cHRlZCBzdGF0ZSB0aGF0IHNoYXJlcyBjb21tb24gcmVzb3VyY2VzCj4+IHdpdGggU0VWLiBVc2lu
ZyBhbiBleHRyYSBDRyBmb3IgaXRzIHB1cnBvc2UgZG9lc24ndCBzZWVtIHRvCj4+IHByb3ZpZGUg
bXVjaCB2YWx1ZS4gVGhpcyBwYXRjaCB3aWxsIGNsZWFuIHVwIHRoZSBjb250cm9sIGdyb3VwCj4+
IGFsb25nIHdpdGggbXVsdGlwbGUgY2hlY2tzIHRoYXQgYmVjb21lIHJlZHVuZGFudCB3aXRoIGl0
Lgo+PiAKPj4gVGhlIHBhdGNoIHdpbGwgYWxzbyByZW1vdmUgYSByZWR1bmRhbnQgbG9naWMgb24g
c2V2IGluaXRpYWxpemF0aW9uCj4+IHRoYXQgcHJvZHVjZXMgU0VWLUVTIHRvIGJlIGRpc2FibGVk
LCB3aGlsZSBzdXBwb3J0ZWQgYnkgdGhlIGNwdQo+PiBhbmQgcmVxdWVzdGVkIGJ5IHRoZSB1c2Vy
IHRocm91Z2ggdGhlIHNldl9lcyBwYXJhbWV0ZXIuCj4gCj4gSW4gd2hhdCBzZW5zZSBpcyBpdCBz
aGFyZWQ/ICBUaGUgU0VWIEFTSURzIGFuZCB0aGUgU0VWLUVTIEFTSURzIGFyZQo+IHNlcGFyYXRl
IChhbmQgaW4gYm90aCBjYXNlcyBsaW1pdGVkKSByZXNvdXJjZXMsIGFuZCB0aGVyZWZvcmUgdGhl
eQo+IGhhdmUgc2VwYXJhdGUgY2dyb3Vwcy4KCiAgICAgTmV2ZXJtaW5kIHRoaXMgcGF0Y2gsIGFm
dGVyIGEgcGFpbmZ1bCBiaW9zIHVwZ3JhZGUgSSBnb3Qgc2V2LWVzCmF2YWlsYWJsZSBpbiBpdCwg
YW5kIEkgd2FzIGFibGUgdG8gbGF1bmNoIHNvbWUgdGVzdCB2bSBvbiBpdCwgc28gdGhpcwptYXkg
b25seSBiZSBicmVha2luZyB0aGluZ3MuIFNvcnJ5IGZvciB0aGUgbm9pc2UhCgogICAgIEpvc8Op
LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1r
ZXJuZWwtbWVudGVlcyBtYWlsaW5nIGxpc3QKTGludXgta2VybmVsLW1lbnRlZXNAbGlzdHMubGlu
dXhmb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1rZXJuZWwtbWVudGVlcwo=
