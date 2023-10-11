Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2109ECD98E0
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 11 Oct 2023 00:28:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8926C4158B;
	Wed, 11 Oct 2023 00:28:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8926C4158B
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazon201209 header.b=ZSBua0an
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bhB5K7r6kDFg; Wed, 11 Oct 2023 00:28:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 4C5714012E;
	Wed, 11 Oct 2023 00:28:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C5714012E
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 24F9EC0039;
	Wed, 11 Oct 2023 00:28:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F1DA4C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Oct 2023 00:28:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A14BD60F27
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Oct 2023 00:28:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A14BD60F27
Authentication-Results: smtp3.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256
 header.s=amazon201209 header.b=ZSBua0an
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RtYw00AcDBh3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Oct 2023 00:28:29 +0000 (UTC)
Received: from smtp-fw-80008.amazon.com (smtp-fw-80008.amazon.com
 [99.78.197.219])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B789D60AA8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Oct 2023 00:28:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B789D60AA8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1696984109; x=1728520109;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xuZcVqG1Y38jX5g59zUv7HtsOiRZ/8gim6olwT/sCKY=;
 b=ZSBua0anw1DmE5gSi/cZwOywlNHud/6p+0of1xlFIHDzkoGIzh2TWgM6
 JcYye8+VIpsNXEBDsoG89P1WAw+a/MfAV8dzUi8zd/dPyrTYz/j23pOQg
 5lVHHb20i11KQayPmS+BR+fbEg09Cowuk3VkrbT+ayP2MwWsrBuolB01S Q=;
X-IronPort-AV: E=Sophos;i="6.03,214,1694736000"; d="scan'208";a="34964492"
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO
 email-inbound-relay-iad-1a-m6i4x-edda28d4.us-east-1.amazon.com)
 ([10.25.36.214]) by smtp-border-fw-80008.pdx80.corp.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 00:28:26 +0000
Received: from EX19MTAUWC002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-iad-1a-m6i4x-edda28d4.us-east-1.amazon.com (Postfix)
 with ESMTPS id 7A7708047B; Wed, 11 Oct 2023 00:28:25 +0000 (UTC)
Received: from EX19D004ANA001.ant.amazon.com (10.37.240.138) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.37; Wed, 11 Oct 2023 00:28:25 +0000
Received: from 88665a182662.ant.amazon.com.com (10.187.171.21) by
 EX19D004ANA001.ant.amazon.com (10.37.240.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.37; Wed, 11 Oct 2023 00:28:22 +0000
To: <f.fainelli@gmail.com>
Subject: Re: [PATCH] Remove extra unlock for the mutex
Date: Tue, 10 Oct 2023 17:28:14 -0700
Message-ID: <20231011002814.77527-1-kuniyu@amazon.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <ab48efc3-9f40-4eed-bdb1-4ce04d3c55cf@gmail.com>
References: <ab48efc3-9f40-4eed-bdb1-4ce04d3c55cf@gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.187.171.21]
X-ClientProxiedBy: EX19D039UWB001.ant.amazon.com (10.13.138.119) To
 EX19D004ANA001.ant.amazon.com (10.37.240.138)
Precedence: Bulk
Cc: netdev@vger.kernel.org, dsahern@kernel.org, linux-kernel@vger.kernel.org,
 singhabhinav9051571833@gmail.com, edumazet@google.com, kuniyu@amazon.com,
 kuba@kernel.org, pabeni@redhat.com,
 linux-kernel-mentees@lists.linuxfoundation.org, davem@davemloft.net
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
From: Kuniyuki Iwashima via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Kuniyuki Iwashima <kuniyu@amazon.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

From: Florian Fainelli <f.fainelli@gmail.com>
Date: Tue, 10 Oct 2023 15:51:13 -0700
> On 10/10/23 15:46, Abhinav Singh wrote:
> > There is a double unlock on mutex. This can cause undefined behaviour.
> 
> Where is the double unlock of head->lock (which is a spinlock and not a 
> mutex, btw)?

Maybe head is just confused with the preceding head2 as the two are
the same type of struct.  They are pointers of different hash tables
though.

bind()ing two sockets to the same 2-tuple will easily trigger hung task.


> 
> > 
> > Signed-off-by: Abhinav Singh <singhabhinav9051571833@gmail.com>
> > ---
> >   net/ipv4/inet_connection_sock.c | 1 -
> >   1 file changed, 1 deletion(-)
> > 
> > diff --git a/net/ipv4/inet_connection_sock.c b/net/ipv4/inet_connection_sock.c
> > index aeebe8816689..f11fe8c727a4 100644
> > --- a/net/ipv4/inet_connection_sock.c
> > +++ b/net/ipv4/inet_connection_sock.c
> > @@ -597,7 +597,6 @@ int inet_csk_get_port(struct sock *sk, unsigned short snum)
> >   	}
> >   	if (head2_lock_acquired)
> >   		spin_unlock(&head2->lock);
> > -	spin_unlock_bh(&head->lock);
> >   	return ret;
> >   }
> >   EXPORT_SYMBOL_GPL(inet_csk_get_port);
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
