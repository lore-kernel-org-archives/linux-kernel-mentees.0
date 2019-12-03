Return-Path: <SRS0=o3A5=ZZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74C72C432C3
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Dec 2019 12:03:11 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 460C0206EC
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Dec 2019 12:03:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="mRwFLE5S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 460C0206EC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 31AFC86E53;
	Tue,  3 Dec 2019 12:03:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KsjuvdeTjREW; Tue,  3 Dec 2019 12:03:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id B4A4886EC9;
	Tue,  3 Dec 2019 12:03:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9F7DAC1799;
	Tue,  3 Dec 2019 12:03:09 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A3DA7C087F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Dec 2019 12:03:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 92EB186E53
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Dec 2019 12:03:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0bO1HRILx91R
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Dec 2019 12:03:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id AA14E870B3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Dec 2019 12:03:06 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 04D872068E;
 Tue,  3 Dec 2019 12:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1575374586;
 bh=X3xxWWIPEUious9vCNNY5FmVrTaTZ1isVPGSJ+SVmvE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mRwFLE5SiCcv4UB1m9HGKPNV7kwg7Z58Zi2nNNXc94MJRyYtkmHQgjs6tZ7tyv0FS
 zfJxyXEev4XRO1uJUIAsvBpytUBUmxO+KlVHQLUy15duz6PSpFm+3NeQhuqAVmUmdf
 tan0usNmmWpILPrTssIozou+ssfjSom5WjlAcMxg=
Date: Tue, 3 Dec 2019 13:03:04 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Amol Grover <frextrite@gmail.com>
Message-ID: <20191203120304.GA2126088@kroah.com>
References: <20191203062503.GA3467@workstation-kernel-dev>
 <20191203064052.GA1788679@kroah.com>
 <20191203071415.GA9640@workstation-portable>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191203071415.GA9640@workstation-portable>
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

On Tue, Dec 03, 2019 at 12:44:15PM +0530, Amol Grover wrote:
> On Tue, Dec 03, 2019 at 07:40:52AM +0100, Greg KH wrote:
> > On Tue, Dec 03, 2019 at 11:55:03AM +0530, Amol Grover wrote:
> > > Compiled, Booted, however I'm getting the following errors when running
> > > "make kselftest"
> > > 
> > > sudo dmesg -l alert
> > > 
> > > [34381.903893] BUG: kernel NULL pointer dereference, address: 0000000000000008
> > > [34381.903904] #PF: supervisor read access in kernel mode
> > > [34381.903908] #PF: error_code(0x0000) - not-present page
> > 
> > Which test causes this problem?
> 
> IIRC I didn't run make kselftest with summary=1 option. Is there any
> other way to get that information? The logs that kselftest generated
> also don't seem to help in this.

Watch the output when you run this?  I don't know, try re-running it
with that option.

> > ANd is it new in 5.3.13?
> > 
> 
> I previously ran kselftest on 5.4-rc7 and 5.3.9 (default kernel shipped
> by openSUSE), both were fine. However, a bit of backstory:
> 
> A day ago I used kselftest from the linux/next branch and ran it (w/o
> sudo).  It showed me the exact same error. However, I was running a
> modified version of 5.3.13, but those modifications were actually
> trivial (5 lines changed) and shouldn't have resulted in this kernel
> error. So, I switched to the vanilla 5.3.13 and ran kselftest (w/o sudo)
> again. I ran it 3 times (w/o any errors), switched back to the modified
> kernel and ran kselftest (w/o root) 2 more times and everything was
> fine. Then I decided to test the vanilla one again for the 4th time, but
> this time I ran kselftest as root where this BUG popped again.

Try a kernel.org 5.3.9 and if that works, then try 5.3.13 and if that
fails, run 'git bisect' and try to find the offending kernel commit.

thanks,

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
