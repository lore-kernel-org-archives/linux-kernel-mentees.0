Return-Path: <SRS0=axgb=4X=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5522C10F00
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  6 Mar 2020 15:25:58 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A4A552073D
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  6 Mar 2020 15:25:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A4A552073D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 63491876F2;
	Fri,  6 Mar 2020 15:25:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4+O1MUiiCJ1P; Fri,  6 Mar 2020 15:25:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 62CFE8770C;
	Fri,  6 Mar 2020 15:25:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4FF2FC18D3;
	Fri,  6 Mar 2020 15:25:56 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6EB43C013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Mar 2020 15:25:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 584F98833C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Mar 2020 15:25:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f+b4CGWjuWBn
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Mar 2020 15:25:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by hemlock.osuosl.org (Postfix) with ESMTPS id A73D388334
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Mar 2020 15:25:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 8478BAD88;
 Fri,  6 Mar 2020 15:25:51 +0000 (UTC)
Received: by ds.suse.cz (Postfix, from userid 10065)
 id 0DAE8DA728; Fri,  6 Mar 2020 16:25:27 +0100 (CET)
Date: Fri, 6 Mar 2020 16:25:27 +0100
From: David Sterba <dsterba@suse.cz>
To: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
Message-ID: <20200306152527.GH2902@twin.jikos.cz>
Mail-Followup-To: dsterba@suse.cz,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>,
 Qu Wenruo <quwenruo.btrfs@gmx.com>, clm@fb.com,
 josef@toxicpanda.com, dsterba@suse.com, linux-btrfs@vger.kernel.org,
 linux-kernel@vger.kernel.org, joel@joelfernandes.org,
 linux-kernel-mentees@lists.linuxfoundation.org, paulmck@kernel.org,
 frextrite@gmail.com, linux@roeck-us.net
References: <20200306065243.11699-1-madhuparnabhowmik10@gmail.com>
 <dfd2c14c-acda-3862-9f48-a512e16a895c@gmx.com>
 <20200306140023.GA14186@madhuparna-HP-Notebook>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200306140023.GA14186@madhuparna-HP-Notebook>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
Cc: joel@joelfernandes.org, paulmck@kernel.org, josef@toxicpanda.com,
 Qu Wenruo <quwenruo.btrfs@gmx.com>, linux-kernel@vger.kernel.org, clm@fb.com,
 linux@roeck-us.net, dsterba@suse.com,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-btrfs@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH] fs: btrfs: block-group.c: Fix
 suspicious RCU usage warning
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
Reply-To: dsterba@suse.cz
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

T24gRnJpLCBNYXIgMDYsIDIwMjAgYXQgMDc6MzA6MjRQTSArMDUzMCwgTWFkaHVwYXJuYSBCaG93
bWlrIHdyb3RlOgo+IE9uIEZyaSwgTWFyIDA2LCAyMDIwIGF0IDAzOjE2OjUzUE0gKzA4MDAsIFF1
IFdlbnJ1byB3cm90ZToKPiA+IAo+ID4gCj4gPiBPbiAyMDIwLzMvNiDkuIvljYgyOjUyLCBtYWRo
dXBhcm5hYmhvd21pazEwQGdtYWlsLmNvbSB3cm90ZToKPiA+ID4gRnJvbTogTWFkaHVwYXJuYSBC
aG93bWlrIDxtYWRodXBhcm5hYmhvd21pazEwQGdtYWlsLmNvbT4KPiA+ID4gCj4gPiA+IFRoZSBz
cGFjZV9pbmZvIGxpc3QgaXMgcmN1IHByb3RlY3RlZC4KPiA+ID4gSGVuY2UsIGl0IHNob3VsZCBi
ZSB0cmF2ZXJzZWQgd2l0aCByY3VfcmVhZF9sb2NrIGhlbGQuCj4gPiA+IAo+ID4gPiBXYXJuaW5n
Ogo+ID4gPiBbICAgMjkuMTA0NTkxXSA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PQo+ID4g
PiBbICAgMjkuMTA0NzU2XSBXQVJOSU5HOiBzdXNwaWNpb3VzIFJDVSB1c2FnZQo+ID4gPiBbICAg
MjkuMTA1MDQ2XSA1LjYuMC1yYzQtbmV4dC0yMDIwMDMwNSAjMSBOb3QgdGFpbnRlZAo+ID4gPiBb
ICAgMjkuMTA1MjMxXSAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ID4gPiBbICAgMjku
MTA1NDAxXSBmcy9idHJmcy9ibG9jay1ncm91cC5jOjIwMTEgUkNVLWxpc3QgdHJhdmVyc2VkIGlu
IG5vbi1yZWFkZXIgc2VjdGlvbiEhCj4gPiA+IAo+ID4gPiBSZXBvcnRlZC1ieTogR3VlbnRlciBS
b2VjayA8bGludXhAcm9lY2stdXMubmV0Pgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBNYWRodXBhcm5h
IEJob3dtaWsgPG1hZGh1cGFybmFiaG93bWlrMTBAZ21haWwuY29tPgo+ID4gPiAtLS0KPiA+ID4g
IGZzL2J0cmZzL2Jsb2NrLWdyb3VwLmMgfCA0ICsrKy0KPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAz
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+ID4gCj4gPiA+IGRpZmYgLS1naXQgYS9m
cy9idHJmcy9ibG9jay1ncm91cC5jIGIvZnMvYnRyZnMvYmxvY2stZ3JvdXAuYwo+ID4gPiBpbmRl
eCA0MDRlMDUwY2U4ZWUuLjljYWJlZWY2NmY1YiAxMDA2NDQKPiA+ID4gLS0tIGEvZnMvYnRyZnMv
YmxvY2stZ3JvdXAuYwo+ID4gPiArKysgYi9mcy9idHJmcy9ibG9jay1ncm91cC5jCj4gPiA+IEBA
IC0xOTg3LDYgKzE5ODcsNyBAQCBpbnQgYnRyZnNfcmVhZF9ibG9ja19ncm91cHMoc3RydWN0IGJ0
cmZzX2ZzX2luZm8gKmluZm8pCj4gPiAKPiA+IFRoaXMgZnVuY3Rpb24gaXMgb25seSB0cmlnZ2Vy
ZWQgYXQgbW91bnQgdGltZSwgd2hlcmUgbm8gb3RoZXIgcmN1Cj4gPiBvcGVyYXRpb24gY2FuIGhh
cHBlbi4KPiA+Cj4gVGhhbmtzIFF1Lgo+IAo+IEpvZWwgYW5kIFBhdWwsIHdoYXQgc2hvdWxkIHdl
IGRvIGluIHRoaXMgY2FzZT8KPiBTaG91bGQgd2UganVzdCBwYXNzIGNvbmQgPSB0cnVlIG9yIHVz
ZSBsaXN0X2Zvcl9lYWNoX2VudHJ5IGluc3RlYWQ/CgpJIHRoaW5rIHdlIGNhbiBhZmZvcmQgdG8g
YWRkIHJjdSBsb2NrL3VubG9jaywgZXZlbiBpZiBpdCdzIG5vdCBzdHJpY3RseQpuZWNlc3Nhcnkg
ZHVlIHRvIHRoZSBzaW5nbGUgdGhyZWFkZWQgY29udGV4dCB3aGVyZSB0aGUgZnVuY3Rpb24gaXMg
cnVuLgpUaGVyZSBhcmUgc29tZSBsaWdodHdlaWdodCBvcGVyYXRpb25zIGluc2lkZSBhbmQgaW5j
X2Jsb2NrX2dyb3VwIHN0YXJ0cwp3aXRoIHR3byBzcGluIGxvY2tzIHNvIHRoZXJlJ3Mgbm90aGlu
ZyB3ZSdkIGJlIGxvc2luZyB3aXRoIGRpc2FibGVkCnByZWVtcHRpb24gZnJvbSB0aGUgY2FsbGVy
LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1r
ZXJuZWwtbWVudGVlcyBtYWlsaW5nIGxpc3QKTGludXgta2VybmVsLW1lbnRlZXNAbGlzdHMubGlu
dXhmb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1rZXJuZWwtbWVudGVlcwo=
