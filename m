Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5472AE95A91
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  9 Oct 2023 15:04:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D04148202A;
	Mon,  9 Oct 2023 15:04:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D04148202A
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=X6kFfEI4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yHmiCWznFcml; Mon,  9 Oct 2023 15:04:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id A0AD082027;
	Mon,  9 Oct 2023 15:04:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0AD082027
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 871C7C0071;
	Mon,  9 Oct 2023 15:04:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EF00EC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Oct 2023 15:04:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D75C182028
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Oct 2023 15:04:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D75C182028
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sk4tkg9kSTO1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Oct 2023 15:04:05 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EFF7982027
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Oct 2023 15:04:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EFF7982027
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id D6A8FB81247;
 Mon,  9 Oct 2023 15:04:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 668CAC433C7;
 Mon,  9 Oct 2023 15:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696863842;
 bh=zB+vI20UfPAoIRDFm4Wc3RigAKAOlJQXx6ZG9XBMgtU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=X6kFfEI4HpwGjzHjtOzXmkTx/+6u72xXY8H7ww/5qDY2nhVN81Fj6QaE58qWjoxng
 NsYO21WczbjklYww+dY+HfEEmT5pywPC1VFv35AGphK7rOxfnsUHfPEBwQUFRZwGwZ
 8z78vN4K8b0BGXjXV596E9NN8EwUX5bLb7G7GSLfLG9uXNC35stIsbhlrkBDz6qTf/
 5dCXhoxKBix+k807kRU7R/e7mTylWjKvBBPytgUSC83b2O/YHmHlyf0YXwkAbiOaq4
 LM41jMrd3WKOTsERWM56INn6efOz0yeEkJx1I/JQtK1KjcI8Fc3NdgfxNlUXx933Xc
 by1xxCh/24I6w==
Date: Tue, 10 Oct 2023 00:03:56 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v1] samples: kprobes: Fixes a typo
Message-Id: <20231010000356.1805c6e0f517245161ebdf03@kernel.org>
In-Reply-To: <20231009095103.6d08e72a@gandalf.local.home>
References: <20230817170819.77857-1-atulpant.linux@gmail.com>
 <20230923173040.GA159038@atom0118>
 <20231007153900.GA20160@atom0118>
 <20231009095103.6d08e72a@gandalf.local.home>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Cc: shuah@kernel.org, Atul Kumar Pant <atulpant.linux@gmail.com>,
 linux-kernel@vger.kernel.org, anil.s.keshavamurthy@intel.com,
 mhiramat@kernel.org, naveen.n.rao@linux.ibm.com,
 linux-kernel-mentees@lists.linuxfoundation.org, davem@davemloft.net,
 linux-trace-kernel@vger.kernel.org
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

On Mon, 9 Oct 2023 09:51:03 -0400
Steven Rostedt <rostedt@goodmis.org> wrote:

> On Sat, 7 Oct 2023 21:09:00 +0530
> Atul Kumar Pant <atulpant.linux@gmail.com> wrote:
> 
> > On Sat, Sep 23, 2023 at 11:00:46PM +0530, Atul Kumar Pant wrote:
> > > On Thu, Aug 17, 2023 at 10:38:19PM +0530, Atul Kumar Pant wrote:  
> > > > Fixes typo in a function name.
> > > > 
> > > > Signed-off-by: Atul Kumar Pant <atulpant.linux@gmail.com>
> > > > ---
> > > >  samples/kprobes/kretprobe_example.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > 
> > > > diff --git a/samples/kprobes/kretprobe_example.c b/samples/kprobes/kretprobe_example.c
> > > > index cbf16542d84e..ed79fd3d48fb 100644
> > > > --- a/samples/kprobes/kretprobe_example.c
> > > > +++ b/samples/kprobes/kretprobe_example.c
> > > > @@ -35,7 +35,7 @@ struct my_data {
> > > >  	ktime_t entry_stamp;
> > > >  };
> > > >  
> > > > -/* Here we use the entry_hanlder to timestamp function entry */
> > > > +/* Here we use the entry_handler to timestamp function entry */
> > > >  static int entry_handler(struct kretprobe_instance *ri, struct pt_regs *regs)
> > > >  {
> > > >  	struct my_data *data;
> > > > -- 
> > > > 2.25.1
> > > >   
> > > 
> > > 	Hi all, can someone provide comments on this change.  
> > 
> > 			Hi all, can someone please review this change. It has been not
> > 			reviewed for quite some time.
> 
> That's because trivial typos in comments are considered very low priority,
> and are usually only added (if they are ever added) if the maintainer has
> extra time, which may not be for a while.

Anyway, let me pick this. I found this in my inbox now. :)

Thank you,

> 
> -- Steve


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
