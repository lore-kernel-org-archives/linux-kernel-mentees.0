Return-Path: <SRS0=W785=3G=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC23FC33CB6
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 17 Jan 2020 19:35:22 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9EC572072B
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 17 Jan 2020 19:35:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lixom-net.20150623.gappssmtp.com header.i=@lixom-net.20150623.gappssmtp.com header.b="V07u5up/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9EC572072B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 690CF221D9;
	Fri, 17 Jan 2020 19:35:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OkuHsyi93vRP; Fri, 17 Jan 2020 19:35:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id B1BCB221AF;
	Fri, 17 Jan 2020 19:35:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 98AEAC1D81;
	Fri, 17 Jan 2020 19:35:17 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 47477C077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jan 2020 19:35:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 29E4288175
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jan 2020 19:35:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zly+H7goZtIS
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jan 2020 19:35:09 +0000 (UTC)
X-Greylist: delayed 00:08:20 by SQLgrey-1.7.6
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
 [209.85.208.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 731D788170
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jan 2020 19:35:09 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id m26so27561132ljc.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jan 2020 11:35:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lixom-net.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=eWPxiqs2+iCS7ywgBZoPdcaP9J/JZnx6nY7cUof021c=;
 b=V07u5up/I77H9UHL2RgtE8EgTvlvwfaEFYjFWyiW4+y3mmsf6hSpIL9mWxuD8JIASe
 3SSst9qoCTXer85nAaDXwyv/YnBEnPFcdRJ2ybjqyOWOd1gg/3Kd6GrFQfpNmDHi/BMP
 w0ZMrjYcUe+KlA5/lADOtOVfp712SacxUQBPD0QJjcff8V1bsR+QbUjR7dOF/lb0NN96
 usrzIqp2q/vX/xCnYHVsNkAn2erp5+VtyzupP9SaaEZ0FD1ww/8EO+YxsI5seKUG4Cw8
 5CMzNcoox5gW2zipArH3pjEATR80XUQuLFCaEDPaEVYFZGTyxdW97XFsH/XH+eENVwM2
 htDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=eWPxiqs2+iCS7ywgBZoPdcaP9J/JZnx6nY7cUof021c=;
 b=YoMjoXtQSAGygThS8HdEzWtPKFIyyGp91SrAVSntPqbukBel4N8QsOBPTJ2etzBJ4g
 jphSn25pQlT84vP/iuydRwF1Fogwj+y2VSobX8B2lRvqgczxnPG7eG0cAVMoNHhGgIpy
 SID1QDaaWgAq6yA3Llir3rSarYUUmj2SnhpAu1iNteTgdXeIFZ7wolk0ym5Raz7S563P
 XrByE9k188mkrqLWsk1Wz7Gca/73NCS/Wm8lzc6yjAgf7W/1rhL5LoCugCbvw5mQFlQb
 XMieqq04yNYNLMVbamuP8zd2blpWGcwKER2a1pEdr3fJ89hMWA1up3jKlhLkhHG19ju/
 DizA==
X-Gm-Message-State: APjAAAWkGCmN8i1aUQDzfUwP1w/WpS35oXKQZ59cITy0lPKUpzq9qBqA
 4PCvdii54J2MEvVoc06tiy7gL1yfdidBPw==
X-Google-Smtp-Source: APXvYqxdevK1ARk4iG2CURRwB6/qFK6i8RWBWNjzDcLM/Zn5XeE+WkyCWl8OJDp7suwJT87EBjEJlw==
X-Received: by 2002:a2e:9013:: with SMTP id h19mr6192574ljg.223.1579289207431; 
 Fri, 17 Jan 2020 11:26:47 -0800 (PST)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
 by smtp.gmail.com with ESMTPSA id w29sm12592801lfa.34.2020.01.17.11.26.46
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 17 Jan 2020 11:26:46 -0800 (PST)
Date: Fri, 17 Jan 2020 11:25:55 -0800
From: Olof Johansson <olof@lixom.net>
To: santosh.shilimkar@oracle.com
Message-ID: <20200117192555.baoxu4xd7krxgfjz@localhost>
References: <20200117133048.31708-1-frextrite@gmail.com>
 <5d77df7f-8693-0232-dbfe-0acfc37e040f@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5d77df7f-8693-0232-dbfe-0acfc37e040f@oracle.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Cc: "Paul E . McKenney" <paulmck@kernel.org>, linux-kernel@vger.kernel.org,
 arm-soc <arm@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>,
 Joel Fernandes <joel@joelfernandes.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2] drivers: soc: ti:
 knav_qmss_queue: Pass lockdep expression to RCU lists
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

On Fri, Jan 17, 2020 at 10:24:04AM -0800, santosh.shilimkar@oracle.com wrote:
> On 1/17/20 5:30 AM, Amol Grover wrote:
> > inst->handles is traversed using list_for_each_entry_rcu
> > outside an RCU read-side critical section but under the protection
> > of knav_dev_lock.
> > 
> > Hence, add corresponding lockdep expression to silence false-positive
> > lockdep warnings, and harden RCU lists.
> > 
> > Add macro for the corresponding lockdep expression.
> > 
> > Signed-off-by: Amol Grover <frextrite@gmail.com>
> > ---
> > v2:
> > - Remove rcu_read_lock_held() from lockdep expression since it is
> >    implicitly checked for.
> > 
> Looks fine to me.
> 
> Hi Olof, Arnd,
> Can you please pick this one and apply to your driver-soc branch ?
> I already sent out pull request and hence the request.

Hi,

Can you please email the whole patch with sign-off to
soc@kernel.org? Otherwise it won't end up in patchwork, which is how we track
patches and pull requests these days.


Thanks,

-Olof
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
