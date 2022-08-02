Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCACFC00140
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  2 Aug 2022 11:07:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3DE5B405B9;
	Tue,  2 Aug 2022 11:07:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3DE5B405B9
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=IZO632N+
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3oggU365kzTZ; Tue,  2 Aug 2022 11:07:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 4290D40142;
	Tue,  2 Aug 2022 11:07:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4290D40142
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0D555C0033;
	Tue,  2 Aug 2022 11:07:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 65CCBC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  2 Aug 2022 11:07:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2B63540872
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  2 Aug 2022 11:07:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B63540872
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=IZO632N+
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yPm0uV2d9l1d
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  2 Aug 2022 11:07:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42A0840871
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 42A0840871
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  2 Aug 2022 11:07:49 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id gk3so13124339ejb.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 02 Aug 2022 04:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=HhBjbo8A8eWeFC5DIsw7GV25tztk2PipnKxnLI7M/pc=;
 b=IZO632N+8fJgZ63cyIvrli96zxrVST1ZyxOO8uBBjR7RIEMfaWr20NZlDFLUDxhhCX
 TDHj2F4kY+WNO+je4RnJkMQ0dzAZ/xosI0+XAfs+WzvCxsfdFOAdhRgo8UzUKUXdgKVg
 odRGlOFdwz3kFg+ziaFThsZLfgJ+ao3Iq+X8wExis8bP1MhvZrtLr1/2swsb8DIINGqJ
 fRksmk0gBuAkSGJWtRQ785h7GYoedhPHcJgcvHUBPq/JGrLZHA76fqmdp8ltcqDqLq0b
 Ria0Do+5yx7Lg212wl4xvex/Wa3Ox6r2E/JIP4tdxU19UfV7xJz/gCQAz1VaSyvQV6fJ
 +tLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=HhBjbo8A8eWeFC5DIsw7GV25tztk2PipnKxnLI7M/pc=;
 b=ns2wRV3D61ZY2mFnVFkGLO7AVlppCMj/pRrpYbNwKplt1pCn7oX0KshHcX6MgeI/Cf
 QCdFS9QIxbqx7OsS6Y2+sqTw21dIywRbaxGA4P4Kd2F5kywPoNPnA2XSmFoC4Wib8y/8
 V8UBxXtU46BPo7bxRkWnw4y9UinmAoeE7m8DTUazeIiEHmB/EpCbvCBulT3QQYDjpCyr
 1/xmvIjhzImbzTQbP5tVhPTdlSx9YKe+syFQ2H8aL9U1F1LE7Wd85cFhR62uR5ukwe7g
 GPU0/7J1fbCIOM60Zc2k8zFxNVQWjcJPkMAr4chNvfc6CEWT+vfe511jxhElxvoxLJYf
 CUkw==
X-Gm-Message-State: AJIora+DsWnifaoYZgK2EdowELmZ3NpNna4Ts428VcyBiQ4q5NMv74ra
 WGiu02jaylZHpZqEneS8r10=
X-Google-Smtp-Source: AGRyM1uIexBXkZ/W8ypkBhJxXAeE7iOOu9zuACRy8RUXHAcGJJt+UJ5KxTBjnCDBBrNIWr41YAr2KQ==
X-Received: by 2002:a17:907:9801:b0:72f:1a8d:8dbe with SMTP id
 ji1-20020a170907980100b0072f1a8d8dbemr15444298ejc.537.1659438467494; 
 Tue, 02 Aug 2022 04:07:47 -0700 (PDT)
Received: from gmail.com (84-236-113-167.pool.digikabel.hu. [84.236.113.167])
 by smtp.gmail.com with ESMTPSA id
 ck28-20020a0564021c1c00b0043df40e4cfdsm808114edb.35.2022.08.02.04.07.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Aug 2022 04:07:46 -0700 (PDT)
Date: Tue, 2 Aug 2022 13:07:44 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Siddh Raman Pant <code@siddh.me>
Subject: Re: [PATCH] x86/numa: Use cpumask_available instead of hardcoded
 NULL check
Message-ID: <YukFgFTaq4Aw+uht@gmail.com>
References: <20220731160913.632092-1-code@siddh.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220731160913.632092-1-code@siddh.me>
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
 Peter Zijlstra <peterz@infradead.org>, x86@kernel.org,
 linux-kernel <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>,
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

CiogU2lkZGggUmFtYW4gUGFudCA8Y29kZUBzaWRkaC5tZT4gd3JvdGU6Cgo+IEdDQyB3YXJuaW5n
IGxvZzoKPiA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT0KPiAKPiBhcmNoL3g4Ni9tbS9udW1hLmM6IEluIGZ1
bmN0aW9uIOKAmGNwdW1hc2tfb2Zfbm9kZeKAmToKPiBhcmNoL3g4Ni9tbS9udW1hLmM6OTE2OjM5
OiB3YXJuaW5nOiB0aGUgY29tcGFyaXNvbiB3aWxsIGFsd2F5cyBldmFsdWF0ZSBhcyDigJhmYWxz
ZeKAmSBmb3IgdGhlIGFkZHJlc3Mgb2Yg4oCYbm9kZV90b19jcHVtYXNrX21hcOKAmSB3aWxsIG5l
dmVyIGJlIE5VTEwgWy1XYWRkcmVzc10KPiAgIDkxNiB8ICAgICAgICAgaWYgKG5vZGVfdG9fY3B1
bWFza19tYXBbbm9kZV0gPT0gTlVMTCkgewo+ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBefgoKWW91ciBmaXggbWFrZXMgc2Vuc2UgSSBzdXBwb3NlLCBidXQg
SSdtIHdvbmRlcmluZyBob3cgdGVzdGluZyBkaWRuJ3QgCnRyaWdnZXIgdGhpcyB3YXJuaW5nLgoK
T2ZmLXN0YWNrIGlzbid0IGEgcmFyZSBjb25maWcgb3B0aW9uOgoKICBrZXBsZXI6fi90aXA+IG1h
a2UgYWxsbW9kY29uZmlnCiAgIwogICMgTm8gY2hhbmdlIHRvIC5jb25maWcKICAjCiAga2VwbGVy
On4vdGlwPiBncmVwIENQVU1BU0tfT0ZGU1RBQ0sgLmNvbmZpZwogIENPTkZJR19DUFVNQVNLX09G
RlNUQUNLPXkKICBrZXBsZXI6fi90aXA+IAoKV2hhdCBhbSBJIG1pc3Npbmc/Cgo+IEZpeGVzOiBj
MDMyZWY2MGQxYWEgKCJjcHVtYXNrOiBjb252ZXJ0IG5vZGVfdG9fY3B1bWFza19tYXBbXSB0byBj
cHVtYXNrX3Zhcl90IikKPiBGaXhlczogZGUyZDk0NDVmMTYyICgieDg2OiBVbmlmeSBub2RlX3Rv
X2NwdW1hc2tfbWFwIGhhbmRsaW5nIGJldHdlZW4gMzIgYW5kIDY0Yml0IikKClRoZXNlIGFyZSBh
bmNpZW50IGNvbW1pdHMgZnJvbSAyMDA5ICYgMjAxMS4KClRoYW5rcywKCglJbmdvCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWtlcm5lbC1tZW50
ZWVzIG1haWxpbmcgbGlzdApMaW51eC1rZXJuZWwtbWVudGVlc0BsaXN0cy5saW51eGZvdW5kYXRp
b24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LWtlcm5lbC1tZW50ZWVzCg==
