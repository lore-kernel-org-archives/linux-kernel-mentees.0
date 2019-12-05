Return-Path: <SRS0=8tby=Z3=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 347BEC43603
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  5 Dec 2019 14:42:39 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06EC421835
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  5 Dec 2019 14:42:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="wyB/qcr7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 06EC421835
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id C83DF2590E;
	Thu,  5 Dec 2019 14:42:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vnBMeXir9UQZ; Thu,  5 Dec 2019 14:42:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 19DA820487;
	Thu,  5 Dec 2019 14:42:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 16FC3C18DD;
	Thu,  5 Dec 2019 14:42:38 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 67B85C077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  5 Dec 2019 14:42:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 56AFD87347
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  5 Dec 2019 14:42:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5JhYahW3XArf
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  5 Dec 2019 14:42:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id CEC0387388
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  5 Dec 2019 14:42:35 +0000 (UTC)
Received: from paulmck-ThinkPad-P72.home (50-39-105-78.bvtn.or.frontiernet.net
 [50.39.105.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A57BE21835;
 Thu,  5 Dec 2019 14:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1575556955;
 bh=FtTd8bVxAAjI67XfQn8v1CtQq1OrzGzVsHz99P5CJdo=;
 h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
 b=wyB/qcr7cl/TP8lD54Vc7qc5PKSdWWbxLU/jD1ESiCX238PRKuX2vUf5uT872/UqM
 8v8DKdfIwCLe+OqlL6CjnaicKcl7FMooslC4nu8T0GcDWyRHyoZTnsrWSOhiB6t7do
 EsVLSL1biRboSkS8IPxWZn4JS7A15urYFkuSF+6k=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
 id 7A49E35202C9; Thu,  5 Dec 2019 06:42:35 -0800 (PST)
Date: Thu, 5 Dec 2019 06:42:35 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
Message-ID: <20191205144235.GQ2889@paulmck-ThinkPad-P72>
References: <20191204120357.11658-1-madhuparnabhowmik04@gmail.com>
 <20191205002518.GP2889@paulmck-ThinkPad-P72>
 <CAF65HP1WL2yw8nVZi-j9=eehkUJP-eKUy+w9unFXddmPf7_Hqg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAF65HP1WL2yw8nVZi-j9=eehkUJP-eKUy+w9unFXddmPf7_Hqg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Joel Fernandes <joel@joelfernandes.org>, rcu@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH] Include: Linux: rculist_nulls:
 Add docbook comment headers
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
Reply-To: paulmck@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

T24gVGh1LCBEZWMgMDUsIDIwMTkgYXQgMTE6MjU6MzlBTSArMDUzMCwgTWFkaHVwYXJuYSBCaG93
bWlrIHdyb3RlOgo+IE9uIFRodSwgRGVjIDUsIDIwMTkgYXQgNTo1NSBBTSBQYXVsIEUuIE1jS2Vu
bmV5IDxwYXVsbWNrQGtlcm5lbC5vcmc+IHdyb3RlOgo+IAo+ID4gT24gV2VkLCBEZWMgMDQsIDIw
MTkgYXQgMDU6MzM6NTdQTSArMDUzMCwgbWFkaHVwYXJuYWJob3dtaWswNEBnbWFpbC5jb20KPiA+
IHdyb3RlOgo+ID4gPiBGcm9tOiBNYWRodXBhcm5hIEJob3dtaWsgPG1hZGh1cGFybmFiaG93bWlr
MDRAZ21haWwuY29tPgo+ID4gPgo+ID4gPiBUaGlzIHBhdGNoIGFkZHMgZG9jYm9vayBjb21tZW50
IGhlYWRlcnMgZm9yIGhsaXN0X251bGxzX2ZpcnN0X3JjdQo+ID4gPiBhbmQgaGxpc3RfbnVsbHNf
bmV4dF9yY3UgaW4gcmN1bGlzdF9udWxscy5oLgo+ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBN
YWRodXBhcm5hIEJob3dtaWsgPG1hZGh1cGFybmFiaG93bWlrMDRAZ21haWwuY29tPgo+ID4gPiAt
LS0KPiA+Cj4gPiBHb29kIHRvIHNlZSwgdGhhbmsgeW91ISAgQSBmZXcgZ3JhbW1hciBuaXRzIGJl
bG93IC0tIGNvdWxkIHlvdSBwbGVhc2UKPiA+IHVwZGF0ZSBhbmQgcmUtc2VuZD8KPiA+Cj4gPiBU
aGFuayB5b3UsIEkgd2lsbCBzZW5kIHRoZSB1cGRhdGVkIHBhdGNoIHNvb24uCj4gCj4gCj4gPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFRo
YW54LCBQYXVsCj4gPgo+ID4gPiAgaW5jbHVkZS9saW51eC9yY3VsaXN0X251bGxzLmggfCA4ICsr
KysrKysrCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspCj4gPiA+Cj4gPiA+
IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L3JjdWxpc3RfbnVsbHMuaAo+ID4gYi9pbmNsdWRl
L2xpbnV4L3JjdWxpc3RfbnVsbHMuaAo+ID4gPiBpbmRleCA1MTdhMDZmMzZjN2EuLmQ3OTZlZjE4
ZWM1MiAxMDA2NDQKPiA+ID4gLS0tIGEvaW5jbHVkZS9saW51eC9yY3VsaXN0X251bGxzLmgKPiA+
ID4gKysrIGIvaW5jbHVkZS9saW51eC9yY3VsaXN0X251bGxzLmgKPiA+ID4gQEAgLTM4LDkgKzM4
LDE3IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBobGlzdF9udWxsc19kZWxfaW5pdF9yY3Uoc3RydWN0
Cj4gPiBobGlzdF9udWxsc19ub2RlICpuKQo+ID4gPiAgICAgICB9Cj4gPiA+ICB9Cj4gPiA+Cj4g
PiA+ICsvKioKPiA+ID4gKyAqIGhsaXN0X251bGxzX2ZpcnN0X3JjdSAtIHJldHVybnMgdGhlIGZp
cnN0IGVsZW1lbnQgb2YgdGhlIGhhc2ggbGlzdC4KPiA+ID4gKyAqIEBoZWFkOiB0aGUgaGVhZCBm
b3IgeW91ciBsaXN0Lgo+ID4KPiA+IENvdWxkIHlvdSBwbGVhc2Ugc2F5IHNvbWV0aGluZyBsaWtl
ICJUaGUgaGVhZCBvZiB0aGUgbGlzdC4iPwo+ID4gSnVzdCB0byBrZWVwIHBvaW50IG9mIHZpZXcg
bW9yZSBjb25zaXN0ZW50IHRocm91Z2ggdGhlIGRvY3VtZW50YXRpb24uCj4gPgo+ID4gU3VyZSwg
SSB3aWxsIGNoYW5nZSBpdCB0byAiaGVhZCBvZiB0aGUgbGlzdCIuCj4gTW9yZW92ZXIsIGluIHRo
ZSByZXN0IG9mIHRoZSBkb2Nib29rIGNvbW1lbnRzIGluIHRoZSBzYW1lIGZpbGUKPiAocmN1bGlz
dF9udWxscy5oKSwgImhlYWQgZm9yIHlvdXIgbGlzdCIgaXMgdXNlZC4KPiBTbywgc2hvdWxkIEkg
Y2hhbmdlIHRoYXQgYXMgd2VsbCBpbiBhIHNlcGFyYXRlIHBhdGNoLCBzdWNoIHRoYXQgaXQgaXMK
PiBjb25zaXN0ZW50IHRocm91Z2hvdXQgdGhlIGZpbGU/CgpQbGVhc2UgZG8hCgoJCQkJCQlUaGFu
eCwgUGF1bAoKPiA+ID4gKyAqLwo+ID4gPiAgI2RlZmluZSBobGlzdF9udWxsc19maXJzdF9yY3Uo
aGVhZCkgXAo+ID4gPiAgICAgICAoKigoc3RydWN0IGhsaXN0X251bGxzX25vZGUgX19yY3UgX19m
b3JjZSAqKikmKGhlYWQpLT5maXJzdCkpCj4gPiA+Cj4gPiA+ICsvKioKPiA+ID4gKyAqIGhsaXN0
X251bGxzX25leHRfcmN1IC0gcmV0dXJucyB0aGUgZWxlbWVudCBvZiB0aGUgbGlzdCBuZXh0IHRv
IEBub2RlLgo+ID4KPiA+IEhlcmUsIGNvdWxkIHlvdSBwbGVhc2UgY2hhbmdlICJuZXh0IHRvIiB0
byAiYWZ0ZXIiPyAgVGhpcyByZW1vdmVzIHRoZQo+ID4gYW1iaWd1aXR5IHdoZXJlIGJvdGggdGhl
IHByaW9yIGFuZCB0aGUgc3Vic2VxdWVudCBlbGVtZW50cyBtaWdodCBiZQo+ID4gdGhvdWdodCBv
ZiBhcyAibmV4dCB0byIuCj4gPgo+ID4gU3VyZSwgSSB3aWxsIGRvIGl0LiBUaGFuayB5b3UgZm9y
IHBvaW50aW5nIG91dC4KPiAKPiBSZWdhcmRzLAo+IE1hZGh1cGFybmEKPiAKPiAKPiA+ID4gKyAq
IEBub2RlOiBFbGVtZW50IG9mIHRoZSBsaXN0Lgo+ID4gPiArICovCj4gPiA+ICAjZGVmaW5lIGhs
aXN0X251bGxzX25leHRfcmN1KG5vZGUpIFwKPiA+ID4gICAgICAgKCooKHN0cnVjdCBobGlzdF9u
dWxsc19ub2RlIF9fcmN1IF9fZm9yY2UgKiopJihub2RlKS0+bmV4dCkpCj4gPiA+Cj4gPiA+IC0t
Cj4gPiA+IDIuMTcuMQo+ID4gPgo+ID4KPiDhkKcKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgta2VybmVsLW1lbnRlZXMgbWFpbGluZyBsaXN0Ckxp
bnV4LWtlcm5lbC1tZW50ZWVzQGxpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0
cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgta2VybmVsLW1lbnRl
ZXMK
