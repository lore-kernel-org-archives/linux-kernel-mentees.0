Return-Path: <SRS0=+2mV=3M=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0933C2D0DB
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 23 Jan 2020 13:42:12 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9153620661
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 23 Jan 2020 13:42:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ghY3yLnX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9153620661
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 6C88920425;
	Thu, 23 Jan 2020 13:42:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AEZ-KpZi7wyo; Thu, 23 Jan 2020 13:42:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id D787220346;
	Thu, 23 Jan 2020 13:42:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D415AC18DD;
	Thu, 23 Jan 2020 13:42:11 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7145DC0174
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Jan 2020 13:42:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 6C86686AA1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Jan 2020 13:42:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qYPKV38XWac2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Jan 2020 13:42:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 7DAAF84580
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Jan 2020 13:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579786928;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DLEMxQhGSuf4cGARaP8BbUtM3QDAvsLJHg8ui8SL7r0=;
 b=ghY3yLnXuiWOtSUrOsv+s/bLU3/0lJik7uPj1u5O4BYHn9do3nHNvafkv43QYo+qtfqsTx
 G/P0ln4R2irmk5YLE3Hn+AMvWSTY21SJUEngwRfK793aiV2su39KvenuzRWvgzQlcHPomQ
 OQLPOcluXOSUaqjPvhv4HL6Qrchs7j8=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-42-w48rhCtZNsCaftKGGMPXgg-1; Thu, 23 Jan 2020 08:42:06 -0500
Received: by mail-lj1-f197.google.com with SMTP id u9so1086110ljg.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Jan 2020 05:42:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=4DPy+R5bPTq7tZWsMUKnzOUpzVwlGaLd1jlg2QWm2Yw=;
 b=aZujt9s/oH18+NZdss/5ckenWLA9Qq5hslzmNvyrFlEuunyWN8bptclUlOnPVjdXqo
 8p0m/15PWLNqpLW2TAmg+dRHp8sYWCWzKaT4I9bDBsUdhB0tGt6hELu4WrnTwqbItylQ
 /+JXEPU/Ih7c3dKzaMKoYbb/zCVWh3kbnRMgp4ownz38xaC5xYOOo4IjWL+Te6F2RXml
 jc7ULR27/ityIz9UO+d5kK06Obq1Q5FIsgYmfH7I0Fr/rA4H6SbeUVU9ymMjevW3QgCd
 7mbGLxY0FYGVz5S+VG0JBIcqZPwJghqj2tzrk0MyHW1C//EADZic8WkdRHD6Je6Fz4jv
 O8lw==
X-Gm-Message-State: APjAAAU7vWy8iZ/3Lp8YXIo4WLxV3+JcK+nZYtqYrvJmUp3Z4Y/ysWLQ
 I4DLCU54FqWLtm2sMBbe1ZaeDSxO7wIHDre71JJ32qPq4MUbcr5OuuMLZFKPsylW1SYuRAdPWcu
 0xhp+uGYYLZuiXRB3q9CTOGJJWZwP11PohOgxDfF20blSMYky
X-Received: by 2002:a19:f811:: with SMTP id a17mr4794443lff.182.1579786924714; 
 Thu, 23 Jan 2020 05:42:04 -0800 (PST)
X-Google-Smtp-Source: APXvYqyTmGyH6Qd2cv+F2F7Drf9s7FCX03KscxdhXqeEkXE/A8+ijDXZ9rPq2Sq7zIK+6Vbk3ftI/Q==
X-Received: by 2002:a19:f811:: with SMTP id a17mr4794418lff.182.1579786924504; 
 Thu, 23 Jan 2020 05:42:04 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([85.204.121.218])
 by smtp.gmail.com with ESMTPSA id w20sm1284895ljo.33.2020.01.23.05.42.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jan 2020 05:42:03 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
 id 2E9961800FF; Thu, 23 Jan 2020 14:42:03 +0100 (CET)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: Jesper Dangaard Brouer <brouer@redhat.com>,
 Amol Grover <frextrite@gmail.com>
In-Reply-To: <20200123143725.036140e7@carbon>
References: <20200123120437.26506-1-frextrite@gmail.com>
 <20200123143725.036140e7@carbon>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Thu, 23 Jan 2020 14:42:03 +0100
Message-ID: <87a76e9tn8.fsf@toke.dk>
MIME-Version: 1.0
X-MC-Unique: w48rhCtZNsCaftKGGMPXgg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: Song Liu <songliubraving@fb.com>,
 Jakub Kicinski <jakub.kicinski@netronome.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 "Paul E . McKenney" <paulmck@kernel.org>, netdev@vger.kernel.org,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Martin KaFai Lau <kafai@fb.com>, brouer@redhat.com,
 Joel Fernandes <joel@joelfernandes.org>, Yonghong Song <yhs@fb.com>,
 bpf@vger.kernel.org, Andrii Nakryiko <andriin@fb.com>,
 "David S . Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] bpf: devmap: Pass lockdep
	expression to RCU lists
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

Jesper Dangaard Brouer <brouer@redhat.com> writes:

> On Thu, 23 Jan 2020 17:34:38 +0530
> Amol Grover <frextrite@gmail.com> wrote:
>
>> head is traversed using hlist_for_each_entry_rcu outside an
>> RCU read-side critical section but under the protection
>> of dtab->index_lock.
>
> We do hold the lock in update and delete cases, but not in the lookup
> cases.  Is it then still okay to add the lockdep_is_held() annotation?

I concluded 'yes' from the comment on hlist_for_each_entry_rcu():

The lockdep condition gets passed to this:

#define __list_check_rcu(dummy, cond, extra...)				\
	({								\
	check_arg_count_one(extra);					\
	RCU_LOCKDEP_WARN(!cond && !rcu_read_lock_any_held(),		\
			 "RCU-list traversed in non-reader section!");	\
	 })


so that seems fine :)

-Toke

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
