Return-Path: <SRS0=axgb=4X=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 806C2C10F25
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  6 Mar 2020 20:00:23 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F02920709
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  6 Mar 2020 20:00:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b="qk06El3J"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F02920709
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 193BE88525;
	Fri,  6 Mar 2020 20:00:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uUSpmfhF1Q-i; Fri,  6 Mar 2020 20:00:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5B139883BC;
	Fri,  6 Mar 2020 20:00:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 43838C18D3;
	Fri,  6 Mar 2020 20:00:20 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7A7A6C013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Mar 2020 20:00:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 64A7F87146
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Mar 2020 20:00:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s4SzP8wryuEJ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Mar 2020 20:00:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id CE5FD87141
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Mar 2020 20:00:17 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id x7so1566910pgh.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 06 Mar 2020 12:00:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=joelfernandes.org; s=google;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=QaNxcQb7Gg+vxIHDRqfm2dfWV4oEZhj/ZtvsBzj/+Bk=;
 b=qk06El3JD3uD38dR/+KpHsLyQqx2wruXRJgkstX2ahhw9X3IFGj5nLe2Z+o4giq/pM
 ldJs5F7oyuhAevtUXI557hIOqP78gga6BNTgb4Smwr0CdmuPgHBd9R/mpRAuAVFgT6Si
 FO4sdeP9aVDm3bSjSYygt3LXsi7uG2og5cDNg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=QaNxcQb7Gg+vxIHDRqfm2dfWV4oEZhj/ZtvsBzj/+Bk=;
 b=UV6BEiGGNip0/IDyT05wr5OjrOmo1R5nkisGvYEcsu0cfEB9n+jHaaetbCKkia209I
 e1bjICnLBfa0H2+lFlP3o0BdemrxasH70bwa/zLjrVTJJxkRASaL+EATYFjh8uQgdLch
 G9RyzrLbyJ0h2920FpqAhyn/d4mRLt2Ai+QkrfGhWTFci6XPKAwe2Mp2lURgVFlSHNEr
 W/K9os1ByIoyHyVUPSbXQgCii3BQsoEYgBQPZv042knvNCrk2+CKiol4gyheK0kmHePO
 hpYWB3lR9OK1JMZwpOvGYus0nsC1UmzIoD854Gl+kfq6CqIA0L9mj30Ld14c799/JSv0
 S4yQ==
X-Gm-Message-State: ANhLgQ2DrlbFbryQMdPK0qGFEKaPncAbBEf6ilG6aZmsqP7VxqRsHRa1
 taKEWonHZZNToXiE3X6mVyDcOYl4p0U=
X-Google-Smtp-Source: ADFU+vtbUmkkv8Fc33D5K6vbh/9sVOZA5kQ0oSPjOpP/B5uhae1bm0YKFhE+l4pQ9zfnhd2Fpzr5Rw==
X-Received: by 2002:a05:6214:1051:: with SMTP id
 l17mr4508705qvr.175.1583524404428; 
 Fri, 06 Mar 2020 11:53:24 -0800 (PST)
Received: from localhost ([2620:15c:6:12:9c46:e0da:efbf:69cc])
 by smtp.gmail.com with ESMTPSA id x188sm8961139qka.53.2020.03.06.11.53.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2020 11:53:23 -0800 (PST)
Date: Fri, 6 Mar 2020 14:53:23 -0500
From: Joel Fernandes <joel@joelfernandes.org>
To: dsterba@suse.cz, Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>,
 Qu Wenruo <quwenruo.btrfs@gmx.com>, clm@fb.com,
 josef@toxicpanda.com, dsterba@suse.com, linux-btrfs@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, paulmck@kernel.org,
 frextrite@gmail.com, linux@roeck-us.net
Message-ID: <20200306195323.GE60713@google.com>
References: <20200306065243.11699-1-madhuparnabhowmik10@gmail.com>
 <dfd2c14c-acda-3862-9f48-a512e16a895c@gmx.com>
 <20200306140023.GA14186@madhuparna-HP-Notebook>
 <20200306152527.GH2902@twin.jikos.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200306152527.GH2902@twin.jikos.cz>
User-Agent: Mutt/1.12.2 (2019-09-21)
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

T24gRnJpLCBNYXIgMDYsIDIwMjAgYXQgMDQ6MjU6MjdQTSArMDEwMCwgRGF2aWQgU3RlcmJhIHdy
b3RlOgo+IE9uIEZyaSwgTWFyIDA2LCAyMDIwIGF0IDA3OjMwOjI0UE0gKzA1MzAsIE1hZGh1cGFy
bmEgQmhvd21payB3cm90ZToKPiA+IE9uIEZyaSwgTWFyIDA2LCAyMDIwIGF0IDAzOjE2OjUzUE0g
KzA4MDAsIFF1IFdlbnJ1byB3cm90ZToKPiA+ID4gCj4gPiA+IAo+ID4gPiBPbiAyMDIwLzMvNiDk
uIvljYgyOjUyLCBtYWRodXBhcm5hYmhvd21pazEwQGdtYWlsLmNvbSB3cm90ZToKPiA+ID4gPiBG
cm9tOiBNYWRodXBhcm5hIEJob3dtaWsgPG1hZGh1cGFybmFiaG93bWlrMTBAZ21haWwuY29tPgo+
ID4gPiA+IAo+ID4gPiA+IFRoZSBzcGFjZV9pbmZvIGxpc3QgaXMgcmN1IHByb3RlY3RlZC4KPiA+
ID4gPiBIZW5jZSwgaXQgc2hvdWxkIGJlIHRyYXZlcnNlZCB3aXRoIHJjdV9yZWFkX2xvY2sgaGVs
ZC4KPiA+ID4gPiAKPiA+ID4gPiBXYXJuaW5nOgo+ID4gPiA+IFsgICAyOS4xMDQ1OTFdID09PT09
PT09PT09PT09PT09PT09PT09PT09PT09Cj4gPiA+ID4gWyAgIDI5LjEwNDc1Nl0gV0FSTklORzog
c3VzcGljaW91cyBSQ1UgdXNhZ2UKPiA+ID4gPiBbICAgMjkuMTA1MDQ2XSA1LjYuMC1yYzQtbmV4
dC0yMDIwMDMwNSAjMSBOb3QgdGFpbnRlZAo+ID4gPiA+IFsgICAyOS4xMDUyMzFdIC0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gPiA+ID4gWyAgIDI5LjEwNTQwMV0gZnMvYnRyZnMvYmxv
Y2stZ3JvdXAuYzoyMDExIFJDVS1saXN0IHRyYXZlcnNlZCBpbiBub24tcmVhZGVyIHNlY3Rpb24h
IQo+ID4gPiA+IAo+ID4gPiA+IFJlcG9ydGVkLWJ5OiBHdWVudGVyIFJvZWNrIDxsaW51eEByb2Vj
ay11cy5uZXQ+Cj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogTWFkaHVwYXJuYSBCaG93bWlrIDxtYWRo
dXBhcm5hYmhvd21pazEwQGdtYWlsLmNvbT4KPiA+ID4gPiAtLS0KPiA+ID4gPiAgZnMvYnRyZnMv
YmxvY2stZ3JvdXAuYyB8IDQgKysrLQo+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPiA+ID4gCj4gPiA+ID4gZGlmZiAtLWdpdCBhL2ZzL2J0
cmZzL2Jsb2NrLWdyb3VwLmMgYi9mcy9idHJmcy9ibG9jay1ncm91cC5jCj4gPiA+ID4gaW5kZXgg
NDA0ZTA1MGNlOGVlLi45Y2FiZWVmNjZmNWIgMTAwNjQ0Cj4gPiA+ID4gLS0tIGEvZnMvYnRyZnMv
YmxvY2stZ3JvdXAuYwo+ID4gPiA+ICsrKyBiL2ZzL2J0cmZzL2Jsb2NrLWdyb3VwLmMKPiA+ID4g
PiBAQCAtMTk4Nyw2ICsxOTg3LDcgQEAgaW50IGJ0cmZzX3JlYWRfYmxvY2tfZ3JvdXBzKHN0cnVj
dCBidHJmc19mc19pbmZvICppbmZvKQo+ID4gPiAKPiA+ID4gVGhpcyBmdW5jdGlvbiBpcyBvbmx5
IHRyaWdnZXJlZCBhdCBtb3VudCB0aW1lLCB3aGVyZSBubyBvdGhlciByY3UKPiA+ID4gb3BlcmF0
aW9uIGNhbiBoYXBwZW4uCj4gPiA+Cj4gPiBUaGFua3MgUXUuCj4gPiAKPiA+IEpvZWwgYW5kIFBh
dWwsIHdoYXQgc2hvdWxkIHdlIGRvIGluIHRoaXMgY2FzZT8KPiA+IFNob3VsZCB3ZSBqdXN0IHBh
c3MgY29uZCA9IHRydWUgb3IgdXNlIGxpc3RfZm9yX2VhY2hfZW50cnkgaW5zdGVhZD8KPiAKPiBJ
IHRoaW5rIHdlIGNhbiBhZmZvcmQgdG8gYWRkIHJjdSBsb2NrL3VubG9jaywgZXZlbiBpZiBpdCdz
IG5vdCBzdHJpY3RseQo+IG5lY2Vzc2FyeSBkdWUgdG8gdGhlIHNpbmdsZSB0aHJlYWRlZCBjb250
ZXh0IHdoZXJlIHRoZSBmdW5jdGlvbiBpcyBydW4uCj4gVGhlcmUgYXJlIHNvbWUgbGlnaHR3ZWln
aHQgb3BlcmF0aW9ucyBpbnNpZGUgYW5kIGluY19ibG9ja19ncm91cCBzdGFydHMKPiB3aXRoIHR3
byBzcGluIGxvY2tzIHNvIHRoZXJlJ3Mgbm90aGluZyB3ZSdkIGJlIGxvc2luZyB3aXRoIGRpc2Fi
bGVkCj4gcHJlZW1wdGlvbiBmcm9tIHRoZSBjYWxsZXIuCgpJIHRoaW5rIHVzZSBsaXN0X2Zvcl9l
YWNoX2VudHJ5KCkuCgp0aGFua3MsCgogLSBKb2VsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1rZXJuZWwtbWVudGVlcyBtYWlsaW5nIGxpc3QK
TGludXgta2VybmVsLW1lbnRlZXNAbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZwpodHRwczovL2xp
c3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1rZXJuZWwtbWVu
dGVlcwo=
