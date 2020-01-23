Return-Path: <SRS0=+2mV=3M=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC1FDC33CAF
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 23 Jan 2020 17:10:38 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 701C2206D4
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 23 Jan 2020 17:10:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q+0rToUt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 701C2206D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 42221884CF;
	Thu, 23 Jan 2020 17:10:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nb2G6P0DGqFn; Thu, 23 Jan 2020 17:10:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id D38A7884CD;
	Thu, 23 Jan 2020 17:10:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B7B6DC18DD;
	Thu, 23 Jan 2020 17:10:37 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E15CFC0174
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Jan 2020 17:10:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id CAEF1876A5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Jan 2020 17:10:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pXzZ1R-AQ9fp
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Jan 2020 17:10:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 21D9983DC2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Jan 2020 17:10:35 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id q8so1821621pfh.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Jan 2020 09:10:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=dwJyEOh0uaEFN8hvYa0cHHjOAWxYFsxMT7IvzzrReQI=;
 b=Q+0rToUtIGpg7FyoIxscNn0/RvwL4rrUkiWJ2n9IN6HO9n6C92QHkv3PBUv041aJYu
 mhN6B7xMAbD4MEjZ1KErr52A1355A4yLo/jrh+8OMVJFVMi9N0uLTD/xzth/Z5XXNuiH
 pj+n1GxZR1N3JjT3luH+GnzF2OUyJBJmFx5VrQKzi9Ku6ijV1k5R+Y/ABzn0msWOLa+S
 AQacTj99pd98x2EEzNLKNNTDAMGCRkI+Gv35q69dZGeHCyFII22FwqTtXv7huPFQjZyg
 jdx/c+WMlH/0fkCS9kzBPsMPYl9tBQWnKxG6GkXVV0lrMwCKApfi2RA6gkvJfIEXwxRF
 Q0wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=dwJyEOh0uaEFN8hvYa0cHHjOAWxYFsxMT7IvzzrReQI=;
 b=kjIZBjFGXmSoCPaMw4ih1FifJyF2GYukKJbODKLSzlecJqUA406s0N9Zyw8ZJYdMjo
 gxpYUdlWuSgVcyy3jW+UZj+mnj0+L7tohdBLfotvnr/YbYyIguZwJtVRCqOywqRAWUar
 nJFMBSMUPoQf07lqgSfGfquEjDtugHcMLTG7+podQUAj6jvnLb+0pYihdyeo0IBcAsMR
 WFtkdTvvFT4hIOjskOGcK9y2bxoZcEeMml81oxHomKQoMn4AY9jWVbZup0xf/pXNYALU
 KWUN8JW/jR9M0sDHgeHEdXD+fAie5e9nQVSS9AH+57AMPcqNybSz9UFBrXtkI+bsbf7m
 hTLA==
X-Gm-Message-State: APjAAAVKm/KQfLc9//XpsRl55ILUlkd3xnXL4CqBoL4Qz7BJkdbyRfb7
 LvjOLpjyq7dIdeh94bYSFtE=
X-Google-Smtp-Source: APXvYqzsPgVtLCqC7XrdMEUUv9WDoR31GK4BL6XC9b4+BRA3q1+quhAdIpoKGpQQi5I2/2vFliqsPg==
X-Received: by 2002:a63:780d:: with SMTP id t13mr4718336pgc.82.1579799434594; 
 Thu, 23 Jan 2020 09:10:34 -0800 (PST)
Received: from workstation-portable ([103.211.17.138])
 by smtp.gmail.com with ESMTPSA id bo19sm3405156pjb.25.2020.01.23.09.10.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jan 2020 09:10:34 -0800 (PST)
Date: Thu, 23 Jan 2020 22:40:25 +0530
From: Amol Grover <frextrite@gmail.com>
To: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
Message-ID: <20200123171025.GB4484@workstation-portable>
References: <20200123120437.26506-1-frextrite@gmail.com>
 <20200123143725.036140e7@carbon> <87a76e9tn8.fsf@toke.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87a76e9tn8.fsf@toke.dk>
User-Agent: Mutt/1.12.2 (2019-09-21)
Cc: Song Liu <songliubraving@fb.com>,
 Jakub Kicinski <jakub.kicinski@netronome.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 "Paul E . McKenney" <paulmck@kernel.org>, netdev@vger.kernel.org,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Martin KaFai Lau <kafai@fb.com>, Jesper Dangaard Brouer <brouer@redhat.com>,
 Joel Fernandes <joel@joelfernandes.org>, Yonghong Song <yhs@fb.com>,
 bpf@vger.kernel.org, Andrii Nakryiko <andriin@fb.com>,
 "David S . Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] bpf: devmap: Pass lockdep
	expression to RCU lists
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

T24gVGh1LCBKYW4gMjMsIDIwMjAgYXQgMDI6NDI6MDNQTSArMDEwMCwgVG9rZSBIw7hpbGFuZC1K
w7hyZ2Vuc2VuIHdyb3RlOgo+IEplc3BlciBEYW5nYWFyZCBCcm91ZXIgPGJyb3VlckByZWRoYXQu
Y29tPiB3cml0ZXM6Cj4gCj4gPiBPbiBUaHUsIDIzIEphbiAyMDIwIDE3OjM0OjM4ICswNTMwCj4g
PiBBbW9sIEdyb3ZlciA8ZnJleHRyaXRlQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4+IGhlYWQg
aXMgdHJhdmVyc2VkIHVzaW5nIGhsaXN0X2Zvcl9lYWNoX2VudHJ5X3JjdSBvdXRzaWRlIGFuCj4g
Pj4gUkNVIHJlYWQtc2lkZSBjcml0aWNhbCBzZWN0aW9uIGJ1dCB1bmRlciB0aGUgcHJvdGVjdGlv
bgo+ID4+IG9mIGR0YWItPmluZGV4X2xvY2suCj4gPgo+ID4gV2UgZG8gaG9sZCB0aGUgbG9jayBp
biB1cGRhdGUgYW5kIGRlbGV0ZSBjYXNlcywgYnV0IG5vdCBpbiB0aGUgbG9va3VwCj4gPiBjYXNl
cy4gIElzIGl0IHRoZW4gc3RpbGwgb2theSB0byBhZGQgdGhlIGxvY2tkZXBfaXNfaGVsZCgpIGFu
bm90YXRpb24/Cj4gCj4gSSBjb25jbHVkZWQgJ3llcycgZnJvbSB0aGUgY29tbWVudCBvbiBobGlz
dF9mb3JfZWFjaF9lbnRyeV9yY3UoKToKPiAKPiBUaGUgbG9ja2RlcCBjb25kaXRpb24gZ2V0cyBw
YXNzZWQgdG8gdGhpczoKPiAKPiAjZGVmaW5lIF9fbGlzdF9jaGVja19yY3UoZHVtbXksIGNvbmQs
IGV4dHJhLi4uKQkJCQlcCj4gCSh7CQkJCQkJCQlcCj4gCWNoZWNrX2FyZ19jb3VudF9vbmUoZXh0
cmEpOwkJCQkJXAo+IAlSQ1VfTE9DS0RFUF9XQVJOKCFjb25kICYmICFyY3VfcmVhZF9sb2NrX2Fu
eV9oZWxkKCksCQlcCj4gCQkJICJSQ1UtbGlzdCB0cmF2ZXJzZWQgaW4gbm9uLXJlYWRlciBzZWN0
aW9uISIpOwlcCj4gCSB9KQo+IAo+IAo+IHNvIHRoYXQgc2VlbXMgZmluZSA6KQo+IAoKWWVzLCBh
ZGRpbmcgYSBsb2NrZGVwIGV4cHJlc3Npb24gd2lsbCBiZSBva2F5LiBUaGlzIGlzIGJlY2F1c2Ug
YW4KaW1wbGljaXQgY2hlY2sgaXMgZG9uZSB0byBjaGVjayBpZiBsaXN0X2Zvcl9lYWNoX2VudHJ5
X3JjdSgpIGlzCnRyYXZlcnNlZCB1bmRlciBSQ1UgcmVhZC1zaWRlIGNyaXRpY2FsIHNlY3Rpb24u
IEluIGNhc2UgdGhlIHRyYXZlcnNhbCBpcwpvdXRzaWRlIFJDVSByZWFkLXNpZGUgY3JpdGljYWwg
c2VjdGlvbiwgdGhlIGxvY2tkZXAgZXhwcmVzc2lvbiBtYWtlcwpzdXJlIHRoZSB0cmF2ZXJzYWwg
aXMgZG9uZSB1bmRlciB0aGUgbWVudGlvbmVkIGxvY2suCgpUaGFua3MKQW1vbAoKPiAtVG9rZQo+
IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1r
ZXJuZWwtbWVudGVlcyBtYWlsaW5nIGxpc3QKTGludXgta2VybmVsLW1lbnRlZXNAbGlzdHMubGlu
dXhmb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1rZXJuZWwtbWVudGVlcwo=
