Return-Path: <SRS0=LNDZ=Z7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00D9EC43603
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  9 Dec 2019 20:31:27 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C27772068E
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  9 Dec 2019 20:31:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=paul-moore-com.20150623.gappssmtp.com header.i=@paul-moore-com.20150623.gappssmtp.com header.b="TQXKisb/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C27772068E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=paul-moore.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 872B18783C;
	Mon,  9 Dec 2019 20:31:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kJQdcXMdn-WC; Mon,  9 Dec 2019 20:31:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9F98C87836;
	Mon,  9 Dec 2019 20:31:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8E193C1796;
	Mon,  9 Dec 2019 20:31:25 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AFB7DC0881
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Dec 2019 20:31:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id ABDAD86151
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Dec 2019 20:31:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3yEoTFxX1tdf
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Dec 2019 20:31:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
 [209.85.208.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 7F623860FD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Dec 2019 20:31:22 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id c19so17135960lji.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 09 Dec 2019 12:31:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RtSnkh/bQ3nRcwbPWyDEoC5sS6sTfNQ61n5WXag4RSg=;
 b=TQXKisb/u+nCZaUFIHZbt6vrBToHvsyyouYG83bL9aHsrrjtRvdZJwM/ghFdOcNL0l
 7PwEsI2aN6kU6bd43IEAstkXa6YHlDXIOgcVERCOMQHucxZJOQ9BK7Fsx2wuivc2+4VI
 pYS+1LsVVnCQXPWL+2Y77ddGR7l38DTZ2RwKIFM9qvspawn4aM+iNu57Ek/PcDFJQ3Eb
 itaCwV988R+Rnfy/GmZbzGIelc409+ljtTRAXZXdKrMuauXcKavAsJC/j6Lkr+MlexwH
 XOFXIlLPFh+hANyweaeumsdP/KP5yvaPutyihrpesAZJJx8D5KVix6iJSHodZCcXXw40
 NbyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RtSnkh/bQ3nRcwbPWyDEoC5sS6sTfNQ61n5WXag4RSg=;
 b=ZWkzHE6QfEM6O5Mubo1OqSoP/rCV+J50T4COsKzuNy+TkGiKuGcJN2QzYUiovhQXJQ
 8ktyvndgqAjFGS5HtEeoxJJo8pZuBAUPsrvY5TDK+srF0hvCXHV3Z6JsQQEXoyAfWMo1
 HY0h/dAIsWK52KpANSUsIzTR0BjoW3M/u2kg2Yin3Ln6Iw398sd7KU6lI1kDQDmeSzo0
 yBxnDUGxNvWRWFoY3aYsEMLmy6hsgf6Ct99iIeqLtN+dX5i4jpepmYmKGltXWx84aK4x
 QVXI0du0MpQwBweShNAJS6Q2wtkWD9rjX+G7aWW4ZauC+ZpYob5BixKj8WWUlgoYLgyW
 jivg==
X-Gm-Message-State: APjAAAUmbHgXjsK7Ag9yUumeskV8X/YjHmW7PmW0IsLmJJ5VYxF11GJ3
 OpKrmisnoz7u7cf1AOXgXhN02C332wNbaZKbO2k6
X-Google-Smtp-Source: APXvYqwNuaM3T1RoYDtFsytt5qY7kCFzvkm2V35m9l8RLEbT2lVNz1KT7NTjE2alakRLWdNQcQZBGT6GCrkypO1NLyE=
X-Received: by 2002:a2e:9d9a:: with SMTP id c26mr686698ljj.225.1575923480292; 
 Mon, 09 Dec 2019 12:31:20 -0800 (PST)
MIME-Version: 1.0
References: <20191201183347.18122-1-frextrite@gmail.com>
 <20191202211915.GF17234@google.com>
 <CAHC9VhTTS43aKQojtoBRRipP7TwhaVnK7DAqpFN0J0_FNLY+sw@mail.gmail.com>
 <20191202233458.GN17234@google.com>
In-Reply-To: <20191202233458.GN17234@google.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 9 Dec 2019 15:31:09 -0500
Message-ID: <CAHC9VhSLM=MBXEXiwG+in1+WrTvVpSJxm+eYH51xRfMkoCafBA@mail.gmail.com>
To: Joel Fernandes <joel@joelfernandes.org>
Cc: paulmck@kernel.org, linux-kernel@vger.kernel.org,
 Eric Paris <eparis@redhat.com>, rcu@vger.kernel.org, linux-audit@redhat.com,
 linux-kernel-mentees@lists.linuxfoundation.org, rostedt@kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v3] kernel: audit.c: Add __rcu
	annotation to RCU pointer
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Mon, Dec 2, 2019 at 6:35 PM Joel Fernandes <joel@joelfernandes.org> wrote:
> On Mon, Dec 02, 2019 at 06:24:29PM -0500, Paul Moore wrote:
> > On Mon, Dec 2, 2019 at 4:19 PM Joel Fernandes <joel@joelfernandes.org> wrote:
> > > Good idea to CC the following on RCU patches:
> > > Paul McKenney
> > > Steven Rostedt
> > > (Any others on the RCU maintainers list).
> > > And, the list: rcu@vger.kernel.org
> > >
> > > Could anyone Ack the patch? Looks safe and straight forward.
> >
> > FWIW, this looks reasonable to me, but I don't see this as a critical
> > fix that needs to go in during the merge window.  Unless I see any
> > objections, I'll plan on merging this into audit/next once the merge
> > window closes.
>
> Sounds good, thanks!

FYI, it's in audit/next now.  Thanks again.

-- 
paul moore
www.paul-moore.com
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
