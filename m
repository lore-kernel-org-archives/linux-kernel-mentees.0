Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A93BBC32774
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 22 Aug 2022 15:41:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F08260E3E;
	Mon, 22 Aug 2022 15:41:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F08260E3E
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=O4vuEFEk
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w1SEEaAiDlIG; Mon, 22 Aug 2022 15:41:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 226CA605D6;
	Mon, 22 Aug 2022 15:41:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 226CA605D6
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EA12DC0032;
	Mon, 22 Aug 2022 15:41:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5C1A3C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Aug 2022 15:41:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 29AA440AF9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Aug 2022 15:41:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 29AA440AF9
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=O4vuEFEk
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W5ZZ86SLJGJ3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Aug 2022 15:40:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9040B403A2
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9040B403A2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Aug 2022 15:40:59 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id y141so10700229pfb.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Aug 2022 08:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=rk9SRCNftCXw4ksd+nOSPjNTRiAuzJr7RvJiVNql6UM=;
 b=O4vuEFEkJRlTwdN5y1v9qKYbQMZ/LDJmgySuo9UvcuTnO9sANcT7+zck7c+0cmh4Jc
 m57EnWe0Q3dh0oVrD8foo2mxUrRfoDjtV4/uCVGUGn+kUeUWzplzA637uPDSIcYKma0r
 DpTgfMtTAThyyLbyBJuI+7qBLm6yVv6y0Q+iDxVCMeCqjmEFK6yNtMMGCgrEBOKZfbee
 z0XxnQTUubPM1uGa1sCMqfXnoqsQ1afKZF00Dlq/y40LopmAFH+Jmuy0DBB7ratofrzX
 KM/ODuqseNPILKG09uepYRl9cEXhehgXfYItn6pwOHOGOZKxI7np53JEax6LF4xD5hKK
 a+AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=rk9SRCNftCXw4ksd+nOSPjNTRiAuzJr7RvJiVNql6UM=;
 b=0fjIphpzvfNrS8S4WmTc1+yWWF0RypcrycMnq22VWywCdQPZHsNlJAfNH5wOZfqSWP
 32unNFaNakXlVyMmf7cim4TDdETfKNXczIXU4kbBCQX88jwapmBa9tjfHiscMzc3f7fD
 bqy/mY5oCBMAotKiiIGMHXEVC+uST+BmH0RHVC2Nwu5Pk6QYVzC6Wm2phgbj2dakOz50
 UeTOU116VCRoj/BnIPcup11pN851zYk0XC/PUYaUL7Licq7aDmdZLuUSWE8E/CsQ+R8C
 vkjIsWVlmlU3eu+tI+bqwhcgW7XLBEi8w6aYxfrvLJelkvCIqgP3pcq/gyJj2zMIaCwa
 a0zg==
X-Gm-Message-State: ACgBeo27IcIs+1xP1yidu3sUfevPMpklqLYARXt0Z8Djnf5jOik2cEHP
 kV0kbtueDGzDzmjcvgZovPc=
X-Google-Smtp-Source: AA6agR5gl+Oek7jTSV2Py3XeGLz3Megkxk4EWM1wUwvswOLUWLHaz+rIRKSN8NH+NaRKi7TziiuRGA==
X-Received: by 2002:a63:81c6:0:b0:42a:3d97:723c with SMTP id
 t189-20020a6381c6000000b0042a3d97723cmr13682587pgd.9.1661182859027; 
 Mon, 22 Aug 2022 08:40:59 -0700 (PDT)
Received: from localhost ([36.112.204.208]) by smtp.gmail.com with ESMTPSA id
 w19-20020a656953000000b0040c40b022fbsm7370993pgq.94.2022.08.22.08.40.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 08:40:58 -0700 (PDT)
From: Hawkins Jiawei <yin31149@gmail.com>
To: dan.carpenter@oracle.com
Subject: Re: [PATCH] rxrpc: fix bad unlock balance in rxrpc_do_sendmsg
Date: Mon, 22 Aug 2022 23:39:43 +0800
Message-Id: <20220822153944.6204-1-yin31149@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220822140532.GF2695@kadam>
References: <20220822140532.GF2695@kadam>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, davem@davemloft.net, dhowells@redhat.com,
 syzbot+7f0483225d0c94cb3441@syzkaller.appspotmail.com, edumazet@google.com,
 yin31149@gmail.com, paskripkin@gmail.com, marc.dionne@auristor.com,
 kuba@kernel.org, pabeni@redhat.com,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-afs@lists.infradead.org
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

On Mon, 22 Aug 2022 at 22:06, Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> On Mon, Aug 22, 2022 at 07:55:27PM +0600, Khalid Masum wrote:
> > >
> > > /*
> > > + * @holding_mutex: An indication whether caller can still holds
> > > + * the call->user_mutex when returned to caller.
> >
> > Maybe we can use mutex_is_locked instead of using the holding_mutex
> > parameter to get whether call->user_mutex is still held.
>
> That doesn't work.  What if there is contention for the lock and someone
> else took it.  Locks under contention are sort of the whole point of
> locking so it's highly likely.
I trid this before, it doesn't work as Dan points out. I think
it seems that mutex_is_locked() only checks whether there is a task
holding the mutex, but do not check whether it is current task holding
mutex. I also tried lockdep_is_held(), lockdep_is_held() seems can detect
call->user_mutex is still held accurately, although this cannot be the patch.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
