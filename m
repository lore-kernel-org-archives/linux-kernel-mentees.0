Return-Path: <SRS0=zsCJ=A2=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39D45C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 15 Jul 2020 05:32:41 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7E6F2068F
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 15 Jul 2020 05:32:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="egb9jXVx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E7E6F2068F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id A7A2B89380;
	Wed, 15 Jul 2020 05:32:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o8gqA8cj+qTH; Wed, 15 Jul 2020 05:32:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 13C5E890FE;
	Wed, 15 Jul 2020 05:32:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E1F89C0891;
	Wed, 15 Jul 2020 05:32:39 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 51462C0733
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Jul 2020 05:32:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 35E0A898E2
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Jul 2020 05:32:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sk3zJuPbhz9x
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Jul 2020 05:32:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 3A01E8928D
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Jul 2020 05:32:35 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id dm19so640227edb.13
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 22:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=z108IIRESYmhbx1QK8rIiv6fHGjuvrxhmuqbJhdfsOE=;
 b=egb9jXVxGsCvLdBGce1HF8ghS6v3XinhSeil9rF/2titx0KG8QpzfW1zHJujAMvGkR
 M8JXbzuCPX0ov/K+tNRdJ1U1GktNJ92Iny1oy6P1jd+43Z0MjYqTpsefkO9+3m91RGVO
 7vYWzOuV1yfZqe3FaTU/qz2Bb93Cqel1zoQz5S6ujnVTMQSnGpeS/rq85uEDdOT8gZBn
 pGlnuLYMiT6nZ9BDlVAw1m0TryvqI7OjWz9Jklp9IKDX5mVKajVwvIjgBCcmPX1js4Nz
 LWv3vAjCbpYeS7bLgBTD6oy3cp2yj7hb5Fx6flbRHHUAhUR4NFcF4IJsrW0mN0XTOpmh
 n4Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=z108IIRESYmhbx1QK8rIiv6fHGjuvrxhmuqbJhdfsOE=;
 b=cZWcBSQplqrv+09IOzvUFlIcjXkeJhJVYUEFFcbHVBAlTwJh1D/5fxdBordj7furT4
 Jppk88aPCZlkr0GIpER+fCKMw9yQuoM7ieTNsF76x9LsJkbBiuo6WHkgpZ7y+uhcOJz3
 psn5e6SChUpQYs27BGZhT2BvyyFuh0cpfDhkU/8S0khp1WCp8cscC8qjeTdCo0IZXUPL
 BUbhojaU96mdt5O+b6It8hZTPGGdoffGIpLxCVkMIlZ5hXKitmSvfT4XFgIpuMtWzNIi
 NyCtEefOLbdSYAaLZYX6sMZ2QnuRlgbCbwbL/wL666mfbXqi68zC6CKerzJ5Hr0Fxd4U
 hwDw==
X-Gm-Message-State: AOAM5310YI2GpxAeT/NLKkqCU/JGQux8v3wT7E/9iBWdkGno/sFxieds
 XBhfxY3MlKn6egqPLCmAFek=
X-Google-Smtp-Source: ABdhPJwhCuNWy407M6lrt6PiJSi1tnrKcp8+sNXsgk8xRJlPE2Zk0kVVgDvsiH2cjxn8mK/zSMUmMQ==
X-Received: by 2002:aa7:d650:: with SMTP id v16mr7874645edr.361.1594791153382; 
 Tue, 14 Jul 2020 22:32:33 -0700 (PDT)
Received: from felia ([2001:16b8:2d84:5800:9551:c180:76b7:2dd0])
 by smtp.gmail.com with ESMTPSA id u5sm922689ejz.15.2020.07.14.22.32.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2020 22:32:32 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Wed, 15 Jul 2020 07:32:25 +0200 (CEST)
X-X-Sender: lukas@felia
To: Mrinal Pandey <mrinalmni@gmail.com>
In-Reply-To: <CAD1=X6m2Lp-KE-xHN1uE7egZRp5-gkXbGVC4f5EUjyMfJ12rHQ@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2007150706410.13346@felia>
References: <20200706080814.of3oftqsbp32nwge@mrinalpandey>
 <CAKXUXMzUGMVEWxBmrsPWvtBTuM=7W1uZWRp4OUN4ZPeqX8=VHA@mail.gmail.com>
 <CAD1=X6m06KWb3=VEGkFWpmmV=UC09ZYbj2qpAOyg6OPFM=8KqA@mail.gmail.com>
 <CAKXUXMy_KAHn+FNWviazVcEqK213uLVksq8_8HhjXAW+_OBrzQ@mail.gmail.com>
 <CAD1=X6==MgT6jaNZ9PsPUqV1QTRFKguq9zvV+TtFSHyajFMjUg@mail.gmail.com>
 <CAKXUXMwU21sUTA6vSm19oFF42eX3dxuBEG-cgSoUQBWcYJDOiQ@mail.gmail.com>
 <CAD1=X6mM0cA-8aVO4YaLiUbSnkw0EKCijL12bDWxNfUCaCh87g@mail.gmail.com>
 <CAKXUXMx8RcQrihaYvryhm4N8X4BATLpPmRnDkm6nCmhznugd0g@mail.gmail.com>
 <CAD1=X6m2Lp-KE-xHN1uE7egZRp5-gkXbGVC4f5EUjyMfJ12rHQ@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-459324118-1594791152=:13346"
Cc: Linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: Adjust spelling
	check false positive
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
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-459324118-1594791152=:13346
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT



On Tue, 14 Jul 2020, Mrinal Pandey wrote:

> 
> 
> On Sat, Jul 11, 2020 at 3:17 AM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
> 
> >> For Issue 5: Can you provide me (and the CC: the list) the list of
> >> false positives (the commit hashes) you found for issue 5 on
> >> EXPORT_SYMBOL?
> >
> >
> > Here are the commit hashes for which the warning is issued:
> > 54505a1e2083
> > 75d75b7a4d54
> > 8084c99b9af6
> > bfdaf029c9c9
> > dfd402a4c4ba
> >
> >> Can you also provide a short rationale/explanation for
> >> each case that you considered a false positive?
> >
> >
> > In each case the `EXPORT_SYMBOL()` is correctly written and the variable/function to be exported
> > is also inside the parentheses, still, we get the warning. Please let me know if I am wrong here.
> 
> I checked those warnings. Some of the patches are good cases to check if we can improve the heuristics on
> EXPORT_SYMBOL().
> 
> E.g., commit bfdaf029c9c9 ("ia64: turn csum_partial_copy_from_user() into csum_and_copy_from_user()") looks
> sound to me, and checkpatch.pl should not really warn about that.
> 
> Mrinal, maybe you can find out why checkpatch.pl believes that this case is wrong and needs to be warned
> about?
> 
> 
> Sir,
> 
> Commit `54505a1e2083`, `8084c99b9af6` and `bfdaf029c9c9` have style issues. The documentation says to use
> `EXPORT_SYMBOL()` just after the closing bracket `}` of the function, it is exporting. In these commits `EXPORT
> SYMBOL()`
> is either defined at a point later or has been defined after leaving a blank line which is totally unneeded.
>

Possibly, a new line is okay; I think we would some statistics on the 
overall use of EXPORT_SYMBOL() to see if a new line is generally accepted 
or if it is really a rare case (<3%) and checkpatch.pl should keep 
warning about that.
 
> However, commits `dfd402a4c4ba` and `75d75b7a4d54` look fine to me and have one thing in common, the
> `EXPORT_SYMBOL()` in these is used inside of a macro. checkpatch shouldn't warn about these.
> 

That is probably tricky to handle with checkpatch.pl, though.

> I have noticed checkpatch denoting wrong line numbers for certain files for several commits.
> For example, for the above commit
> `bfdaf029c9c9`, the following warning is issued:
> 
> WARNING: EXPORT_SYMBOL(foo); should immediately follow its function/variable
> #74: FILE: arch/ia64/lib/csum_partial_copy.c:122:
> +EXPORT_SYMBOL(csum_and_copy_from_user);
> 
> but the file arch/ia64/lib/csum_partial_copy.c is only 113 lines long.
> Please let me know if you can reproduce this.

Can you find out how the line number is computed?

Of course, checkpatch.pl is running on the patch, not on any specific 
file. So, in general, you really do not know how long the file was that 
the author based the patch on.

In our case, you need to check the state of the file at the commit above.

I checked that and it seemed correct to me, line 122 refers to 
EXPORT_SYMBOL. So, I do not see the bug here.



Lukas

--8323329-459324118-1594791152=:13346
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--8323329-459324118-1594791152=:13346--
