Return-Path: <SRS0=C1jw=3R=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BBC2C2D0DB
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Jan 2020 15:00:33 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F0602467E
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Jan 2020 15:00:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eCh6W+h+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F0602467E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 1C7E31FE0A;
	Tue, 28 Jan 2020 15:00:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rxAqptIXsJRJ; Tue, 28 Jan 2020 15:00:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 9ABA02000E;
	Tue, 28 Jan 2020 15:00:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6DE6CC0175;
	Tue, 28 Jan 2020 15:00:32 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BC5B4C0171
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jan 2020 15:00:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id B81C71FE0A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jan 2020 15:00:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nbxfpp2ZShmk
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jan 2020 15:00:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by silver.osuosl.org (Postfix) with ESMTPS id 090202000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jan 2020 15:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580223625;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JC/v0R+n19poVshHaFB2ikrnZeGzcPgJ7gdAXwWxsCA=;
 b=eCh6W+h+HbomIPnu+z0cHm+ilbthBqyXBO4TemJkNu2UDjkdm+cqJGCG941zs6liD1j3++
 d8Ue3wlsFhqumSeoXDbDQP50YMvZwbHMdvQClgIhH4ay1gxNWIOXOsmsMSET0DFnvZcwEO
 JFpiGKeRc//fFJXz6VnzudJ/R9lM5y0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-40-Ezdjjf2gPp-tKiDpGIq6Jg-1; Tue, 28 Jan 2020 10:00:17 -0500
X-MC-Unique: Ezdjjf2gPp-tKiDpGIq6Jg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9524513F5;
 Tue, 28 Jan 2020 15:00:15 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-121-70.rdu2.redhat.com
 [10.10.121.70])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D56015DA7E;
 Tue, 28 Jan 2020 15:00:10 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20200128072740.21272-1-frextrite@gmail.com>
References: <20200128072740.21272-1-frextrite@gmail.com>
To: Amol Grover <frextrite@gmail.com>
MIME-Version: 1.0
Content-ID: <2176479.1580223610.1@warthog.procyon.org.uk>
Date: Tue, 28 Jan 2020 15:00:10 +0000
Message-ID: <2176480.1580223610@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Cc: Kees Cook <keescook@chromium.org>, "Paul E . McKenney" <paulmck@kernel.org>,
 Jann Horn <jannh@google.com>, Oleg Nesterov <oleg@redhat.com>,
 James Morris <jamorris@linux.microsoft.com>, linux-kernel@vger.kernel.org,
 dhowells@redhat.com, Shakeel Butt <shakeelb@google.com>,
 Joel Fernandes <joel@joelfernandes.org>, Thomas Gleixner <tglx@linutronix.de>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] cred: Use RCU primitives to
	access RCU pointers
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

Amol Grover <frextrite@gmail.com> wrote:

> task_struct.cred and task_struct.real_cred are annotated by __rcu,
> hence use rcu_access_pointer to access them.
> 
> Fixes the following sparse errors:
> kernel/cred.c:144:9: error: incompatible types in comparison expression
> (different address spaces):
> kernel/cred.c:144:9:    struct cred *
> kernel/cred.c:144:9:    struct cred const [noderef] <asn:4> *
> kernel/cred.c:145:9: error: incompatible types in comparison expression
> (different address spaces):
> kernel/cred.c:145:9:    struct cred *
> kernel/cred.c:145:9:    struct cred const [noderef] <asn:4> *
> 
> Signed-off-by: Amol Grover <frextrite@gmail.com>

Reviewed-by: David Howells <dhowells@redhat.com>

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
