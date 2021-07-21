Return-Path: <SRS0=/QuR=MN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22882C12002
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 21 Jul 2021 13:45:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9AD560FF4
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 21 Jul 2021 13:45:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9AD560FF4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8487B4021E;
	Wed, 21 Jul 2021 13:45:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VXgBDbb4642c; Wed, 21 Jul 2021 13:45:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 4D2364014C;
	Wed, 21 Jul 2021 13:45:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 27551C001A;
	Wed, 21 Jul 2021 13:45:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BE71FC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Jul 2021 13:45:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 983844021F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Jul 2021 13:45:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=suse.cz header.b="n/b1fl3e";
 dkim=neutral reason="invalid (unsupported algorithm ed25519-sha256)"
 header.d=suse.cz header.b="FH1MGv0V"
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gJO4ITZ2btX8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Jul 2021 13:45:00 +0000 (UTC)
X-Greylist: delayed 00:08:03 by SQLgrey-1.8.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2309D4023F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Jul 2021 13:44:59 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 7DD981FEA7;
 Wed, 21 Jul 2021 13:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626874614;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ACSOqLjxdKypbguvriIn2aNR3FddUn7knx9Dv2QbmwE=;
 b=n/b1fl3ecyHZMi/6WIbjgf5cls+zJemQ1MOUkGfSdnHaytU9XIQntu0Nxx76h3BnwHIHQ1
 Ik6PEVpV89wDn7XahUFoLRcGmvvoHpdwtFSLRnojtE87LjWLl70r2auHHewAwYQURaVO0U
 0CqrL77M+5kM5XLds90DyZTX1YQz8X8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626874614;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ACSOqLjxdKypbguvriIn2aNR3FddUn7knx9Dv2QbmwE=;
 b=FH1MGv0VUqlII3Qv7nLEnjfyHdjMsKsmnpuQ3t+FpBT4BNp8YQBKXwk7fHRDr+fYoSVw68
 86TtUebrHBXSGmAw==
Received: from ds.suse.cz (ds.suse.cz [10.100.12.205])
 by relay2.suse.de (Postfix) with ESMTP id 64FC0A3B87;
 Wed, 21 Jul 2021 13:36:54 +0000 (UTC)
Received: by ds.suse.cz (Postfix, from userid 10065)
 id 482F7DA704; Wed, 21 Jul 2021 15:34:13 +0200 (CEST)
Date: Wed, 21 Jul 2021 15:34:13 +0200
From: David Sterba <dsterba@suse.cz>
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Subject: Re: [PATCH] btrfs: fix rw device counting in __btrfs_free_extra_devids
Message-ID: <20210721133412.GE19710@twin.jikos.cz>
Mail-Followup-To: dsterba@suse.cz,
 Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 Nikolay Borisov <nborisov@suse.com>, clm@fb.com,
 josef@toxicpanda.com, dsterba@suse.com, anand.jain@oracle.com,
 linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, gregkh@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 syzbot+a70e2ad0879f160b9217@syzkaller.appspotmail.com
References: <20210715103403.176695-1-desmondcheongzx@gmail.com>
 <7ae7a858-9893-c41c-ed96-10651c295087@suse.com>
 <b8fe8fa5-c022-187f-b10d-3f73e668008a@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b8fe8fa5-c022-187f-b10d-3f73e668008a@gmail.com>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
Cc: syzbot+a70e2ad0879f160b9217@syzkaller.appspotmail.com,
 Nikolay Borisov <nborisov@suse.com>, josef@toxicpanda.com,
 anand.jain@oracle.com, linux-kernel@vger.kernel.org, clm@fb.com,
 dsterba@suse.com, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-btrfs@vger.kernel.org
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

T24gVGh1LCBKdWwgMTUsIDIwMjEgYXQgMDk6MTE6NDNQTSArMDgwMCwgRGVzbW9uZCBDaGVvbmcg
WmhpIFhpIHdyb3RlOgo+IE9uIDE1LzcvMjEgNzo1NSBwbSwgTmlrb2xheSBCb3Jpc292IHdyb3Rl
Ogo+ID4gCj4gPiAKPiA+IE9uIDE1LjA3LjIxINCzLiAxMzozNCwgRGVzbW9uZCBDaGVvbmcgWmhp
IFhpIHdyb3RlOgo+ID4+IFN5emJvdCByZXBvcnRzIGEgd2FybmluZyBpbiBjbG9zZV9mc19kZXZp
Y2VzIHRoYXQgaGFwcGVucyBiZWNhdXNlCj4gPj4gZnNfZGV2aWNlcy0+cndfZGV2aWNlcyBpcyBu
b3QgMCBhZnRlciBjYWxsaW5nIGJ0cmZzX2Nsb3NlX29uZV9kZXZpY2UKPiA+PiBvbiBlYWNoIGRl
dmljZS4KPiA+Pgo+ID4+IFRoaXMgaGFwcGVucyB3aGVuIGEgd3JpdGVhYmxlIGRldmljZSBpcyBy
ZW1vdmVkIGluCj4gPj4gX19idHJmc19mcmVlX2V4dHJhX2RldmlkcywgYnV0IHRoZSBydyBkZXZp
Y2UgY291bnQgaXMgbm90IGRlY3JlbWVudGVkCj4gPj4gYWNjb3JkaW5nbHkuIFNvIHdoZW4gY2xv
c2VfZnNfZGV2aWNlcyBpcyBjYWxsZWQsIHRoZSByZW1vdmVkIGRldmljZSBpcwo+ID4+IHN0aWxs
IGNvdW50ZWQgYW5kIHdlIGdldCBhbiBvZmYgYnkgMSBlcnJvci4KPiA+Pgo+ID4+IEhlcmUgaXMg
b25lIGNhbGwgdHJhY2UgdGhhdCB3YXMgb2JzZXJ2ZWQ6Cj4gPj4gICAgYnRyZnNfbW91bnRfcm9v
dCgpOgo+ID4+ICAgICAgYnRyZnNfc2Nhbl9vbmVfZGV2aWNlKCk6Cj4gPj4gICAgICAgIGRldmlj
ZV9saXN0X2FkZCgpOyAgIDwtLS0tLS0tLS0tLS0tLS0tIGRldmljZSBhZGRlZAo+ID4+ICAgICAg
YnRyZnNfb3Blbl9kZXZpY2VzKCk6Cj4gPj4gICAgICAgIG9wZW5fZnNfZGV2aWNlcygpOgo+ID4+
ICAgICAgICAgIGJ0cmZzX29wZW5fb25lX2RldmljZSgpOyAgIDwtLS0tLS0tLSBydyBkZXZpY2Ug
Y291bnQgKysKPiA+PiAgICAgIGJ0cmZzX2ZpbGxfc3VwZXIoKToKPiA+PiAgICAgICAgb3Blbl9j
dHJlZSgpOgo+ID4+ICAgICAgICAgIGJ0cmZzX2ZyZWVfZXh0cmFfZGV2aWRzKCk6Cj4gPj4gCSAg
X19idHJmc19mcmVlX2V4dHJhX2RldmlkcygpOyAgPC0tLSBkZXZpY2UgcmVtb3ZlZAo+ID4+IAkg
IGZhaWxfdHJlZV9yb290czoKPiA+PiAJICAgIGJ0cmZzX2Nsb3NlX2RldmljZXMoKToKPiA+PiAJ
ICAgICAgY2xvc2VfZnNfZGV2aWNlcygpOyAgIDwtLS0tLS0tIHJ3IGRldmljZSBjb3VudCBvZmYg
YnkgMQo+ID4+Cj4gPj4gRml4ZXM6IGNmODlhZjE0NmI3ZSAoImJ0cmZzOiBkZXYtcmVwbGFjZTog
ZmFpbCBtb3VudCBpZiB3ZSBkb24ndCBoYXZlIHJlcGxhY2UgaXRlbSB3aXRoIHRhcmdldCBkZXZp
Y2UiKQo+ID4+IFJlcG9ydGVkLWJ5OiBzeXpib3QrYTcwZTJhZDA4NzlmMTYwYjkyMTdAc3l6a2Fs
bGVyLmFwcHNwb3RtYWlsLmNvbQo+ID4+IFRlc3RlZC1ieTogc3l6Ym90K2E3MGUyYWQwODc5ZjE2
MGI5MjE3QHN5emthbGxlci5hcHBzcG90bWFpbC5jb20KPiA+PiBTaWduZWQtb2ZmLWJ5OiBEZXNt
b25kIENoZW9uZyBaaGkgWGkgPGRlc21vbmRjaGVvbmd6eEBnbWFpbC5jb20+Cj4gPiAKPiA+IElz
IHRoZXJlIGEgcmVsaWFibGUgcmVwcm9kdWNlciBmcm9tIHN5emJvdD8gQ2FuIHRoaXMgYmUgdHVy
bmVkIGludG8gYW4KPiA+IHhmc3Rlc3Q/Cj4gPiAKPiAKPiBTeXpib3QgaGFzIHNvbWUgcmVsaWFi
bGUgcmVwcm9kdWNlcnMgaGVyZToKPiBodHRwczovL3N5emthbGxlci5hcHBzcG90LmNvbS9idWc/
aWQ9MTEzZDlhMDFjYmUwYWYzZTI5MTYzM2JhN2E3YTNlOTgzYjg2YzNjMAo+IAo+IFNlZW1zIGxp
a2UgaXQgY29uc3RydWN0cyB0d28gaW1hZ2VzIGluLW1lbW9yeSB0aGVuIG1vdW50cyB0aGVtLiBJ
J20gbm90IAo+IHN1cmUgaWYgdGhhdCdzIGFtZW5hYmxlIHRvIGJlIGNvbnZlcnRlZCBpbnRvIGFu
IHhmc3Rlc3Q/CgpJdCB3b3VsZCBuZWVkIHRvIGJlIGFuIGltYWdlIGZyb20gdGhlIHRpbWUgdGhl
IHdhcm5pbmcgaXMgcmVwcm9kdWNlZCwKSSdtIG5vdCBzdXJlIGhvdyBtdWNoIHRpbWluZyBpcyBh
bHNvIGltcG9ydGFudC4gQnV0IGlpcmMgYWRkaW5nIHJhdyB0ZXN0CmltYWdlcyB0byBmc3Rlc3Rz
IHdhcyBub3Qgd2VsY29tZSwgc28gaXQgd291bGQgaGF2ZSB0byBiZSBhIHJlcHJvZHVjZXIKYW5k
IGdpdmVuIHRoYXQgdGhlIHN5emthbGxlciBzb3VyY2UgaXMgbm90IGh1bWFuIHJlYWRhYmxlIEkn
bSBub3Qgc3VyZQppdCB3b3VsZCBiZSB3ZWxjb21lIGVpdGhlci4KCk1heWJlIHRoZXJlJ3Mgc29t
ZSBtaWRkbGUgZ3JvdW5kIHdoZW4gdGhlIGltYWdlIGlzIGNyZWF0ZWQgYnkgbWtmcyBhbmQKZmls
bGVkIHdpdGggdGhlIGRhdGEgYW5kIHRoZW4gdGhlIG1vdW50IGxvb3AgaXMgc3RhcnRlZCBmcm9t
IHNoZWxsLiBCdXQKdGhhdCBtZWFucyB0byB1bnRhbmdsZSB0aGUgQyByZXByb2R1Y2VyLgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1rZXJuZWwt
bWVudGVlcyBtYWlsaW5nIGxpc3QKTGludXgta2VybmVsLW1lbnRlZXNAbGlzdHMubGludXhmb3Vu
ZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1rZXJuZWwtbWVudGVlcwo=
