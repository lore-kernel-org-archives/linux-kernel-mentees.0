Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03E6EC19F2B
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 31 Jul 2022 18:11:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7A33940E08;
	Sun, 31 Jul 2022 18:11:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A33940E08
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=FeKk7GPw
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ie9OeKwBRfbU; Sun, 31 Jul 2022 18:11:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 8746240272;
	Sun, 31 Jul 2022 18:11:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8746240272
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 32AE9C0032;
	Sun, 31 Jul 2022 18:11:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5F7A7C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 Jul 2022 18:11:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1C6A260D71
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 Jul 2022 18:11:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C6A260D71
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=FeKk7GPw
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p3xVp5VLXArh
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 Jul 2022 18:11:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2397360767
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2397360767
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 Jul 2022 18:11:34 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id d20so1272159pfq.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 Jul 2022 11:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=hqBKgf+Ek/JQSC2ln2M+FhamOJdervk7JOSiOKWTnXE=;
 b=FeKk7GPwptQofjZCsnRB6M98VcwSqFPPVXTVn5P5eIpBwkgiDjjqHkXgEV3C6Z6vFD
 4p46kuwmXz60IlNZyF8Ri6j4juO3EQeKMQf08tUD+MTBqb3zhiSidiQvi1fAJk92QbT8
 ZJncYLYWceXFFKGRLlJ/mRjBfW6zlFSgtvDmBCSoe4TmJzymjUVsBJPECPTc2g2lz+Xd
 kwhlgTXrCpxS0ScT34Ah0QUwC+ZWc0JNOlo9XG7gEfmQemEScTd9LrVeKY7QAuVeRVGC
 ks3jN72FnZtyD8pbyLlZytmx56A3lKVFbDJqSENadff5EQfW6lBElkTyYPVCQhqm9NV6
 3cIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=hqBKgf+Ek/JQSC2ln2M+FhamOJdervk7JOSiOKWTnXE=;
 b=HYMkzT93jxePtk1D6sh6+M9gIwv0ePJtkfQpm4dGLMa82F45jYSQsYmAeBC1ZJyfUE
 GA3oF6Rrg0q+KFUVmANRzyNv7KenOBVUWHHAcPyg/mjlFEdbMPaU91Rdx8+NDZAtWGTa
 kU65lWwPA3M6mgBFvkfZ/2t2GdDFUP+FwmKh8tKtI8FYabQf8hk3EXDBT3ZAllrFJ+Yk
 1mMIvXu+oZA7DAbME0hq6wyzeBu+yhjzD2Wm5xB4jPWywAplxUVrvlUvYu807iRlwZpU
 1xWFP/TR/t1lTiXzoa+jMqP777Uq38qAXsBdsPWv9/xOplSEQ4iT49JjNZJpjWom5vgX
 Kxgw==
X-Gm-Message-State: AJIora8Z8ZHIGw8AYr5EZVpSugS2h6/Ko+NMBOF57mHQ4rF3nvJvtOLR
 0KCscbHxBvd0T9p3uaA5dUg=
X-Google-Smtp-Source: AGRyM1sEvp+XYTCpwY4d2dm6Zd2VcBXo3vZHY8FWqth2u8zv48qtjSvQbAihhZJKf0JdVGKrtys2xg==
X-Received: by 2002:a63:1941:0:b0:41b:6722:b2df with SMTP id
 1-20020a631941000000b0041b6722b2dfmr10392818pgz.263.1659291094444; 
 Sun, 31 Jul 2022 11:11:34 -0700 (PDT)
Received: from berlinger (berlinger.seclab.cs.ucsb.edu. [128.111.49.72])
 by smtp.gmail.com with ESMTPSA id
 i18-20020a635852000000b0041bc393e594sm2795825pgm.6.2022.07.31.11.11.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jul 2022 11:11:33 -0700 (PDT)
Date: Sun, 31 Jul 2022 11:11:31 -0700
From: Dipanjan Das <mail.dipanjan.das@gmail.com>
To: Siddh Raman Pant <code@siddh.me>
Subject: Re: [PATCH] kernel/watch_queue: Make pipe NULL while clearing
 watch_queue
Message-ID: <20220731181131.GB3569921@berlinger>
References: <1822b768504.1d4e377e236061.5518350412857967240@siddh.me>
 <20220723135447.199557-1-code@siddh.me>
 <Ytv/4Tljvlt0PJ2r@kroah.com>
 <3558070.1658933200@warthog.procyon.org.uk>
 <182407602ce.190e58816827.7904364186178466266@siddh.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <182407602ce.190e58816827.7904364186178466266@siddh.me>
Cc: syzbot+c70d87ac1d001f29a058
 <syzbot+c70d87ac1d001f29a058@syzkaller.appspotmail.com>,
 linux-security-modules <linux-security-module@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 David Howells <dhowells@redhat.com>,
 Marius Fleischer <fleischermarius@googlemail.com>,
 Eric Dumazet <edumazet@google.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Priyanka Bose <its.priyanka.bose@gmail.com>,
 "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
 linux-kernel-mentees <linux-kernel-mentees@lists.linuxfoundation.org>
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

T24gV2VkLCBKdWwgMjcsIDIwMjIgYXQgMDk6NTA6NTJQTSArMDUzMCwgU2lkZGggUmFtYW4gUGFu
dCB3cm90ZToKPiBUaGFuayB5b3UgZm9yIGV4cGxhaW5pbmcgaXQhCj4gCj4gSSB3aWxsIHNlbmQg
YSB2My4gU2hvdWxkIEkgYWRkIGEgU3VnZ2VzdGVkLWJ5IHRhZyBtZW50aW9uaW5nIHlvdT8KClNv
cnJ5IGZvciBqdW1waW5nIGluLgoKV2UgaGF2ZSByZXBvcnRlZCB0aGUgc2FtZSBidWcgaW4ga2Vy
bmVsIHY1LjEwLjEzMSBbaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsL0NBTlgyTTViSHllMlpF
RWhFVjZQVWoxa1lMMktkV1llSnRnWHc4S1pSendyTnBMWXorQUBtYWlsLmdtYWlsLmNvbV0uIFdl
IGhhdmUgYmVlbiBzdWdnZXN0ZWQgdG8gam9pbiB0aGlzIGRpc2N1c3Npb24gc28gdGhhdCB3ZSBj
YW4gaGF2ZSBhcHByb3ByaWF0ZSBtZXRhLWluZm9ybWF0aW9uIGluamVjdGVkIGluIHRoaXMgcGF0
Y2jigJlzIGNvbW1pdCBtZXNzYWdlIHRvIG1ha2Ugc3VyZSB0aGF0IGl0IGdldHMgYmFja3BvcnRl
ZCB0byB2NS4xMC55LiAgVGhlcmVmb3JlLCB3ZSB3b3VsZCBsaWtlIHRvIGJlIGluIHRoZSBsb29w
IHNvIHRoYXQgd2UgY2FuIG9mZmVyIGhlbHAgaW4gdGhlIHByb2Nlc3MsIGlmIG5lZWRlZC4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWtlcm5l
bC1tZW50ZWVzIG1haWxpbmcgbGlzdApMaW51eC1rZXJuZWwtbWVudGVlc0BsaXN0cy5saW51eGZv
dW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LWtlcm5lbC1tZW50ZWVzCg==
