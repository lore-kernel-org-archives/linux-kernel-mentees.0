Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A060FC77B73
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 30 May 2023 15:55:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A00D417BA;
	Tue, 30 May 2023 15:55:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A00D417BA
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MDQmc10M
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SaJvK3A3x8jH; Tue, 30 May 2023 15:54:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 8CA2A417C5;
	Tue, 30 May 2023 15:54:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8CA2A417C5
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 660DAC0035;
	Tue, 30 May 2023 15:54:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4B76AC002A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 30 May 2023 15:54:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2052140531
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 30 May 2023 15:54:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2052140531
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=MDQmc10M
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WOP3A8MblC18
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 30 May 2023 15:54:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1787F4026A
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1787F4026A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 30 May 2023 15:54:55 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EEDCD61155;
 Tue, 30 May 2023 15:54:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FDFEC433D2;
 Tue, 30 May 2023 15:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685462091;
 bh=W7HyuEs9eRSylX98QC0ucC92RskTVhlHWIeR+1802Ac=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MDQmc10MhvIBRvlB1emFAmsbvZWyfln5YhrmGnBcKKzRcVckXpESn25NXQ/6W+m8g
 9ykJNvj/tPzCw8vfUwQAZQPsSvHscWocz6u3iYDO8VWRyP5QIBw3u1z8CUZCDhFLIy
 mgFyU0CGUfYE3pHW2KFn6SRTkXXeJ8UvvckyqV8EGZ7xkmClm4qu57adEaaPC+J12C
 ltBToZwZFmdnIG8U7sLQBuMc6xK+Px7L54oTiKfduaxobe5sixsLGE4wpNE736T4iC
 BOu0Xeh8LbhL7Hklo9X2o5LEoVgEtUYb9IlF3ci/sstuzjvCzdFHRgj3VJm7XG1bUf
 e21HdYsv55/Sg==
Date: Tue, 30 May 2023 17:54:46 +0200
From: Christian Brauner <brauner@kernel.org>
To: Prince Kumar Maurya <princekumarmaurya06@gmail.com>
Subject: Re: [PATCH v3] fs/sysv: Null check to prevent null-ptr-deref bug
Message-ID: <20230530-gefangen-ersonnen-d1f1b6eea903@brauner>
References: <000000000000cafb9305fc4fe588@google.com>
 <20230528184422.596947-1-princekumarmaurya06@gmail.com>
 <20230530-zenit-radeln-06417ce5fe85@brauner>
 <CAF0B0eKxMf7-uzgRJcWsWW6hgxP25bPG8U9nF0by7mSNvhZmbQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAF0B0eKxMf7-uzgRJcWsWW6hgxP25bPG8U9nF0by7mSNvhZmbQ@mail.gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org,
 chenzhongjin@huawei.com, syzbot+aad58150cbc64ba41bdc@syzkaller.appspotmail.com
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

T24gVHVlLCBNYXkgMzAsIDIwMjMgYXQgMDc6NTk6MTZBTSAtMDcwMCwgUHJpbmNlIEt1bWFyIE1h
dXJ5YSB3cm90ZToKPiBPbiBUdWUsIE1heSAzMCwgMjAyMyBhdCAxOjI24oCvQU0gQ2hyaXN0aWFu
IEJyYXVuZXIgPGJyYXVuZXJAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPgo+ID4gT24gU3VuLCBNYXkg
MjgsIDIwMjMgYXQgMTE6NDQ6MjJBTSAtMDcwMCwgUHJpbmNlIEt1bWFyIE1hdXJ5YSB3cm90ZToK
PiA+ID4gc2JfZ2V0YmxrKGlub2RlLT5pX3NiLCBwYXJlbnQpIHJldHVybiBhIG51bGwgcHRyIGFu
ZCB0YWtpbmcgbG9jayBvbgo+ID4gPiB0aGF0IGxlYWRzIHRvIHRoZSBudWxsLXB0ci1kZXJlZiBi
dWcuCj4gPiA+Cj4gPiA+IFJlcG9ydGVkLWJ5OiBzeXpib3QrYWFkNTgxNTBjYmM2NGJhNDFiZGNA
c3l6a2FsbGVyLmFwcHNwb3RtYWlsLmNvbQo+ID4gPiBDbG9zZXM6IGh0dHBzOi8vc3l6a2FsbGVy
LmFwcHNwb3QuY29tL2J1Zz9leHRpZD1hYWQ1ODE1MGNiYzY0YmE0MWJkYwo+ID4gPiBTaWduZWQt
b2ZmLWJ5OiBQcmluY2UgS3VtYXIgTWF1cnlhIDxwcmluY2VrdW1hcm1hdXJ5YTA2QGdtYWlsLmNv
bT4KPiA+ID4gLS0tCj4gPiA+IENoYW5nZSBzaW5jZSB2MjogVXBkYXRlZCBzdWJqZWN0IGFuZCBh
ZGRlZCBSZXBvcnRlZC1ieSBhbmQgY2xvc2VzIHRhZ3MuCj4gPiA+Cj4gPiA+ICBmcy9zeXN2L2l0
cmVlLmMgfCAyICsrCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4gPiA+
Cj4gPiA+IGRpZmYgLS1naXQgYS9mcy9zeXN2L2l0cmVlLmMgYi9mcy9zeXN2L2l0cmVlLmMKPiA+
ID4gaW5kZXggYjIyNzY0ZmU2NjljLi4zYTZiNjZlNzE5ZmQgMTAwNjQ0Cj4gPiA+IC0tLSBhL2Zz
L3N5c3YvaXRyZWUuYwo+ID4gPiArKysgYi9mcy9zeXN2L2l0cmVlLmMKPiA+ID4gQEAgLTE0NSw2
ICsxNDUsOCBAQCBzdGF0aWMgaW50IGFsbG9jX2JyYW5jaChzdHJ1Y3QgaW5vZGUgKmlub2RlLAo+
ID4gPiAgICAgICAgICAgICAgICAqLwo+ID4gPiAgICAgICAgICAgICAgIHBhcmVudCA9IGJsb2Nr
X3RvX2NwdShTWVNWX1NCKGlub2RlLT5pX3NiKSwgYnJhbmNoW24tMV0ua2V5KTsKPiA+ID4gICAg
ICAgICAgICAgICBiaCA9IHNiX2dldGJsayhpbm9kZS0+aV9zYiwgcGFyZW50KTsKPiA+ID4gKyAg
ICAgICAgICAgICBpZiAoIWJoKQo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgYnJlYWs7Cj4g
Pgo+ID4gV2hlbiB5b3UgYnJlYWsgaGVyZSB5b3UnbGwgaGl0Ogo+ID4KPiA+IC8qIEFsbG9jYXRp
b24gZmFpbGVkLCBmcmVlIHdoYXQgd2UgYWxyZWFkeSBhbGxvY2F0ZWQgKi8KPiA+IGZvciAoaSA9
IDE7IGkgPCBuOyBpKyspCj4gPiAgICAgICAgIGJmb3JnZXQoYnJhbmNoW2ldLmJoKTsKPiA+IGZv
ciAoaSA9IDA7IGkgPCBuOyBpKyspCj4gPiAgICAgICAgIHN5c3ZfZnJlZV9ibG9jayhpbm9kZS0+
aV9zYiwgYnJhbmNoW2ldLmtleSk7Cj4gPgo+ID4gYmVsb3cuIFRoZSBjbGVhbnVwIHBhdGhzIHdl
cmUgY29kZWQgaW4gdGhlIGFzc3VtcHRpb24gdGhhdCBzYl9nZXRibGsoKQo+ID4gY2FuJ3QgZmFp
bC4gU28gYmZvcmdldCgpIGNhbiBhc3N1bWUgdGhhdCBicmFuY2hbaV0uYmggaGFzIGJlZW4gYWxs
b2NhdGVkCj4gPiBhbmQgc2V0IHVwLiBTbyB0aGF0IGJmb3JnZXQoYnJhbmNoW2ldLmJoKSBpcyB5
b3VyIG5leHQgcGVuZGluZyBOVUxMCj4gPiBkZXJlZiBhZmFpY3QuCj4gCj4gCj4gSSBkb3VidCB0
aGF0IHdvdWxkIGhhcHBlbi4gVGhlcmUgaXMgYSBicmVhayBhYm92ZSBhcyB3ZWxsLCBiZWZvcmUg
d2UgZG8KPiBzYl9nZXRibGsoKS4KPiAKPiAvKiBBbGxvY2F0ZSB0aGUgbmV4dCBibG9jayAqLwo+
IGJyYW5jaFtuXS5rZXkgPSBzeXN2X25ld19ibG9jayhpbm9kZS0+aV9zYik7Cj4gaWYgKCFicmFu
Y2hbbl0ua2V5KQo+ICAgIGJyZWFrOwo+IAo+IFRoZSBjbGVhbiB1cCBjb2RlIHBhdGggcnVucyB0
aWxsIGkgaXMgbGVzcyB0aGFuIG4gbm90IGVxdWFsIHRvIG4gd2hpY2gKPiB3b3VsZCBoYXZlIGNh
dXNlZCB0aGUgcHJvYmxlbS4KCkJ1dCB0aGVuIGFyZW4ndCB5b3UgbGVha2luZyBicmFuY2hbbl0u
a2V5IGlmIHlvdSBicmVhayBhZnRlciBmYWlsZWQgc2JfZ2V0YmxrKCkKYWZ0ZXIgc3lzdl9uZXdf
YmxvY2soKSBzdWNjZWVkZWQ/Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LWtlcm5lbC1tZW50ZWVzIG1haWxpbmcgbGlzdApMaW51eC1rZXJuZWwt
bWVudGVlc0BsaXN0cy5saW51eGZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3Vu
ZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWtlcm5lbC1tZW50ZWVzCg==
