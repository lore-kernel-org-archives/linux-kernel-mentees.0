Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E45D0C433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 24 Jul 2022 07:48:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7D76F40BA9;
	Sun, 24 Jul 2022 07:48:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7D76F40BA9
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=siddh.me header.i=code@siddh.me header.a=rsa-sha256 header.s=zmail header.b=QYyZRx9i
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zekqWFGHQuYb; Sun, 24 Jul 2022 07:48:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 75B16400C6;
	Sun, 24 Jul 2022 07:48:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 75B16400C6
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 49CDCC0035;
	Sun, 24 Jul 2022 07:48:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 74A7DC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jul 2022 07:48:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3A48360797
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jul 2022 07:48:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A48360797
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=siddh.me header.i=code@siddh.me
 header.a=rsa-sha256 header.s=zmail header.b=QYyZRx9i
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fRtujomvQURp
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jul 2022 07:48:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C0872606E7
Received: from sender-of-o53.zoho.in (sender-of-o53.zoho.in [103.117.158.53])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C0872606E7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jul 2022 07:48:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1658648915; cv=none; d=zohomail.in; s=zohoarc; 
 b=D7QPHKnVbln4NvVF3VcPvXZvlTD7Slo8l7PX+TEAVNQhojIPVqTSnEy4kFhJPh8nqKfX2jAQsquG68M9HLSih9O0AF0aVjnm/NQZ1/ZgHLczGOE8i4dfzoozTK/AqXbjdWKn39C/hULXOJqX72xj8oGiWyrHWQKqnh3M6kw5jks=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1658648915;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=0CMsPuiLvSHXtnR93pzVmo+ozRvtQTA4XOCT87ZUj8U=; 
 b=QNhIYp9mTvuQ/Nk1dUvoXzVnhz99dMjfEEAOUWCgKpkSkbd8N0ZsjrZw5/ovI3lOOrJ0sFFlozRu1Ofu0ePgtEruNLbfwg12pjOVXj5QTMIH113ymNa084ITA/EPYFMq+HryCRQKc1qdTqpqkZLrEOPcOI5XmzC2cl/Sj+r3cOY=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1658648915; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=0CMsPuiLvSHXtnR93pzVmo+ozRvtQTA4XOCT87ZUj8U=;
 b=QYyZRx9iRJC2IvBtaYqkqvdR3JXzeAlUeBhzwpLB2v9JET3S9ru79glKktT6diyr
 H0WcDq9b4hACwA86Zvz29IlpNy3kUSoHwd2qgDe/StQzxFTLEdvkaKYH2D4YRYBqDbw
 7zeGV7ZF+BHw4AwEorQmGLhVhw7X1ckuBtbp2qME=
Received: from mail.zoho.in by mx.zoho.in
 with SMTP id 1658648902672458.5296544751634;
 Sun, 24 Jul 2022 13:18:22 +0530 (IST)
Date: Sun, 24 Jul 2022 13:18:22 +0530
To: "Hillf Danton" <hdanton@sina.com>
Message-ID: <1822f2dbbef.8458d4be628891.5196957454517111607@siddh.me>
In-Reply-To: <20220724071958.2557-1-hdanton@sina.com>
References: <20220724052426.2504-1-hdanton@sina.com>
 <20220724071958.2557-1-hdanton@sina.com>
Subject: Re: [PATCH v2] kernel/watch_queue: Make pipe NULL while clearing
 watch_queue
MIME-Version: 1.0
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, syzbot+c70d87ac1d001f29a058
 <syzbot+c70d87ac1d001f29a058@syzkaller.appspotmail.com>,
 David Howells <dhowells@redhat.com>,
 linux-security-modules <linux-security-module@vger.kernel.org>,
 linux-kernel-mentees <linux-kernel-mentees@lists.linuxfoundation.org>
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
From: Siddh Raman Pant via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Siddh Raman Pant <code@siddh.me>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Sun, 24 Jul 2022 12:49:58 +0530  Hillf Danton <hdanton@sina.com> wrote:
> Given defunct serialized, still need to clear wqueue->pipe in the clear
> path as proposed?

I am not sure what you mean by this...

If you mean freeing the pipe, it is done by free_pipe_info(), which is
the caller of watch_queue_clear().

If you mean making wqueue->pipe NULL, it is being done so in the patch.

Thanks,
Siddh
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
