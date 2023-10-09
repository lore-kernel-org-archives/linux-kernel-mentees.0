Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75F3BE95A95
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  9 Oct 2023 13:49:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B88AE41478;
	Mon,  9 Oct 2023 13:49:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B88AE41478
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J__TS9J1SKbQ; Mon,  9 Oct 2023 13:49:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id B36B74019E;
	Mon,  9 Oct 2023 13:49:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B36B74019E
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 968C1C0039;
	Mon,  9 Oct 2023 13:49:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0E99BC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Oct 2023 13:49:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E5D0B61183
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Oct 2023 13:49:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E5D0B61183
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QC2LKJlizqdT
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Oct 2023 13:49:52 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E8BE060C17
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Oct 2023 13:49:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E8BE060C17
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id CBA30CE1669;
 Mon,  9 Oct 2023 13:49:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CDFCC433CA;
 Mon,  9 Oct 2023 13:49:45 +0000 (UTC)
Date: Mon, 9 Oct 2023 09:51:03 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Atul Kumar Pant <atulpant.linux@gmail.com>
Subject: Re: [PATCH v1] samples: kprobes: Fixes a typo
Message-ID: <20231009095103.6d08e72a@gandalf.local.home>
In-Reply-To: <20231007153900.GA20160@atom0118>
References: <20230817170819.77857-1-atulpant.linux@gmail.com>
 <20230923173040.GA159038@atom0118>
 <20231007153900.GA20160@atom0118>
X-Mailer: Claws Mail 3.19.1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: shuah@kernel.org, linux-kernel@vger.kernel.org,
 anil.s.keshavamurthy@intel.com, mhiramat@kernel.org,
 naveen.n.rao@linux.ibm.com, linux-kernel-mentees@lists.linuxfoundation.org,
 davem@davemloft.net, linux-trace-kernel@vger.kernel.org
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

On Sat, 7 Oct 2023 21:09:00 +0530
Atul Kumar Pant <atulpant.linux@gmail.com> wrote:

> On Sat, Sep 23, 2023 at 11:00:46PM +0530, Atul Kumar Pant wrote:
> > On Thu, Aug 17, 2023 at 10:38:19PM +0530, Atul Kumar Pant wrote:  
> > > Fixes typo in a function name.
> > > 
> > > Signed-off-by: Atul Kumar Pant <atulpant.linux@gmail.com>
> > > ---
> > >  samples/kprobes/kretprobe_example.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/samples/kprobes/kretprobe_example.c b/samples/kprobes/kretprobe_example.c
> > > index cbf16542d84e..ed79fd3d48fb 100644
> > > --- a/samples/kprobes/kretprobe_example.c
> > > +++ b/samples/kprobes/kretprobe_example.c
> > > @@ -35,7 +35,7 @@ struct my_data {
> > >  	ktime_t entry_stamp;
> > >  };
> > >  
> > > -/* Here we use the entry_hanlder to timestamp function entry */
> > > +/* Here we use the entry_handler to timestamp function entry */
> > >  static int entry_handler(struct kretprobe_instance *ri, struct pt_regs *regs)
> > >  {
> > >  	struct my_data *data;
> > > -- 
> > > 2.25.1
> > >   
> > 
> > 	Hi all, can someone provide comments on this change.  
> 
> 			Hi all, can someone please review this change. It has been not
> 			reviewed for quite some time.

That's because trivial typos in comments are considered very low priority,
and are usually only added (if they are ever added) if the maintainer has
extra time, which may not be for a while.

-- Steve
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
