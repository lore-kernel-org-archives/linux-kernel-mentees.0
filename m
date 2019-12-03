Return-Path: <SRS0=o3A5=ZZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 949B5C432C0
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Dec 2019 17:19:12 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62DE120637
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Dec 2019 17:19:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NRAKz0WY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 62DE120637
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 322C585F33;
	Tue,  3 Dec 2019 17:19:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HVCPHfDVVTVo; Tue,  3 Dec 2019 17:19:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B1D9486A1D;
	Tue,  3 Dec 2019 17:19:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A282BC1799;
	Tue,  3 Dec 2019 17:19:11 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0E12AC087F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Dec 2019 17:19:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 09FDB87745
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Dec 2019 17:19:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZOTiNr-srj8g
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Dec 2019 17:19:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by whitealder.osuosl.org (Postfix) with ESMTPS id D0C348772F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Dec 2019 17:19:08 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id w23so696081pjd.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 03 Dec 2019 09:19:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=MvGhtCxlwLUh97Cz2ry0QgTVu+ycAwIVFhXukCE3WHw=;
 b=NRAKz0WYFeSsTW7sQYsEO9cAPksmC1APLkA78GnFHzeU64EUVVMDCrMjsd/u7hrGB8
 jqv6BLcA/gAkRzmg1sLh4x848HaT6bt55YmhKvD3KBjlSz66neYY5qYfYP7RR51/wASN
 g1qzXaRqtA5+SCrEZbXtYw1jjMnOHGMFftYnS22r6DY/3FxcP+ObUasjStXQeMyfZyJB
 UcH1cL1nisAoc/NeFKR9p8NaMIDe2L2Ang3NyQjbqIcMchuAXuTEUBngrf59d12A+p2W
 rn5SQsVlOGjRNcm1KyHRVQpIXhDA2Qbj6FgTMdit0Efp+M/pBLSCl6xIUwne+wqTb7Qm
 HgZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=MvGhtCxlwLUh97Cz2ry0QgTVu+ycAwIVFhXukCE3WHw=;
 b=Nq5YTIjhh013gpQRaHouT1PTYmIaUSBiBIXqOYkjthr9Q6C6CMCiZhkOV7NG8izIQG
 ZhUdWXYUXJb1F5gSb9edP62vkxo7MZyAJkQDdQ79mVOi5xlhSE+jIUjKQ6PtiUQsjJcD
 ch/q14vtBQc/BBXkgLrpBleAB+U15wqVaukACudoZGPH8yP7ViQUJvbdrYkK0JMwA2O/
 EnkR9QPYH0ScXDj2gPJmamEKIRffeJaW6YqsNTVIRaw8Fj20u75OOoEEBDVKhh/nO7TY
 vluXLxeHwcsHPUm4CCL+Tbb6RuCGgrrkIyyNHNZ7qFpnT42QMavwJJigHgvjKao+EbvF
 BMzQ==
X-Gm-Message-State: APjAAAXKoxTeCK2w72Cqk8OzntT2h9DOPy9CLBKeLABzkYe2IJiv5oxU
 Z6+xh4i9TUOkkDseXRwhkuw=
X-Google-Smtp-Source: APXvYqwFc2PUJx9UYGq4eyzwDy81JnlRsVXxg16uGDygWBDacxMn66NcfGmUEJqjbMPKy32W0dCnug==
X-Received: by 2002:a17:902:8c96:: with SMTP id
 t22mr6077956plo.288.1575393548224; 
 Tue, 03 Dec 2019 09:19:08 -0800 (PST)
Received: from workstation-portable ([139.5.253.93])
 by smtp.gmail.com with ESMTPSA id v10sm4044002pgr.37.2019.12.03.09.19.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2019 09:19:07 -0800 (PST)
Date: Tue, 3 Dec 2019 22:48:17 +0530
From: Amol Grover <frextrite@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Message-ID: <20191203171817.GA24581@workstation-portable>
References: <20191203062503.GA3467@workstation-kernel-dev>
 <20191203064052.GA1788679@kroah.com>
 <20191203071415.GA9640@workstation-portable>
 <20191203120304.GA2126088@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191203120304.GA2126088@kroah.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Cc: linux-kernel-mentees@lists.linuxfoundation.org, stable@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [STABLE TEST] 5.3.13
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

On Tue, Dec 03, 2019 at 01:03:04PM +0100, Greg KH wrote:
> On Tue, Dec 03, 2019 at 12:44:15PM +0530, Amol Grover wrote:
> > On Tue, Dec 03, 2019 at 07:40:52AM +0100, Greg KH wrote:
> > > On Tue, Dec 03, 2019 at 11:55:03AM +0530, Amol Grover wrote:
> > > > Compiled, Booted, however I'm getting the following errors when running
> > > > "make kselftest"
> > > > 
> > > > sudo dmesg -l alert
> > > > 
> > > > [34381.903893] BUG: kernel NULL pointer dereference, address: 0000000000000008
> > > > [34381.903904] #PF: supervisor read access in kernel mode
> > > > [34381.903908] #PF: error_code(0x0000) - not-present page
> > > 
> > > Which test causes this problem?
> > 
> > IIRC I didn't run make kselftest with summary=1 option. Is there any
> > other way to get that information? The logs that kselftest generated
> > also don't seem to help in this.
> 
> Watch the output when you run this?  I don't know, try re-running it
> with that option.
> 

I did. The tls test under tools/testing/selftests/net seems to be the
culprit. More information below.

> > > ANd is it new in 5.3.13?
> > > 
> > 
> > I previously ran kselftest on 5.4-rc7 and 5.3.9 (default kernel shipped
> > by openSUSE), both were fine. However, a bit of backstory:
> > 
> > A day ago I used kselftest from the linux/next branch and ran it (w/o
> > sudo).  It showed me the exact same error. However, I was running a
> > modified version of 5.3.13, but those modifications were actually
> > trivial (5 lines changed) and shouldn't have resulted in this kernel
> > error. So, I switched to the vanilla 5.3.13 and ran kselftest (w/o sudo)
> > again. I ran it 3 times (w/o any errors), switched back to the modified
> > kernel and ran kselftest (w/o root) 2 more times and everything was
> > fine. Then I decided to test the vanilla one again for the 4th time, but
> > this time I ran kselftest as root where this BUG popped again.
> 
> Try a kernel.org 5.3.9 and if that works, then try 5.3.13 and if that
> fails, run 'git bisect' and try to find the offending kernel commit.
> 

After finding the test that was resulting in the BUG, I decided to check
again against 5.3.13 (= BUG). I had recently compiled 5.4.1 as well so I
decided to run this test against 5.4.1 (= BUG). After this I realized I
had 5.3.9 kernel kept away so I decided to run the test against that too
(= BUG). After 5.3.9's error something didn't feel right. Mind you I was
using kselftest from linux/next so I got suspicious about the test
it-self. I ran kselftest from 5.4.1 on kernels 5.4.1 and 5.3.13 and none
of them resulted in the BUG this time. After a bit of digging I found
out the next branch had 2 additional test cases for the tls test, and
one of them (sendmsg_fragmented) is the actual culprit that was causing
all this.

TL;DR: tools/testing/selftests/net/tls.ci:sendmsg_fragmented from the
next tree appears to be broken(?)

Thanks
Amol

> thanks,
> 
> greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
