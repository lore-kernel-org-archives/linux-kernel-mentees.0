Return-Path: <SRS0=CeKo=BL=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2474C433E3
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  1 Aug 2020 14:40:36 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF6A92072A
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  1 Aug 2020 14:40:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="Sle3mw/0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF6A92072A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8B47385617;
	Sat,  1 Aug 2020 14:40:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N9AIC-9gkyRO; Sat,  1 Aug 2020 14:40:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0F0B8854FC;
	Sat,  1 Aug 2020 14:40:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0432EC0050;
	Sat,  1 Aug 2020 14:40:36 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A1FF6C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Aug 2020 14:40:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 90A4788579
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Aug 2020 14:40:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sGpKMv2Y0HQR
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Aug 2020 14:40:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
 [209.85.222.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 54ED388561
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Aug 2020 14:40:33 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id l6so31505249qkc.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 01 Aug 2020 07:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=mRmB4+8PRxBevydZGBnRlc3z9/QvoJxis+WEAA2l688=;
 b=Sle3mw/0UURgSSq5deGhktvSJ9UQXTd9fDmY2doUhJQ3xiPm3nxmtC8U/ayxaSKVwd
 6XH1TNg4uHvRdKlCr3i2GfW4yFjDZCIpGm9rOZwquuIGRMoN4u30hBUXPvrXHrv4d1fp
 vCsYQuv/8VodNDTU/+zdMznVROHKV3h5mkrrBDQ3urmyAhroscFDZBOvL2QGLeJkvLK3
 hGTqu853GgkLnhg1d9PK9ilpO8AIWQOlyr7cxGQQtBtXGhTO8im8YCn6G4zD6+nndoBo
 LuaBGqzqxKZ122RDlCvtk7MhPLRMTqS0ZBWTXQ7y/iodvvBmD/ehmrLLck+DGX55MV3l
 jyTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mRmB4+8PRxBevydZGBnRlc3z9/QvoJxis+WEAA2l688=;
 b=kteEaz4v5QJ5pEhfNxFeCVSMcpWPP92sDuCPIoX+ShvV3SMtNOZC/BpImiFBqahnQu
 v2HeUsv/h7CIN4DKfP8p7MuRB2bAQDeL3sBdoQPjiKI4r0ba71HjFSiNZ6xPYuBaat8W
 Iqczqc8P3xgkB5DzCyPDF820fdAVLUPRRelKujRZbj+VasI9s/6osAzpHWuOovcubfA5
 OxfVYSlvo8upo6L1uQ6DDFJrbBGt6yfLkego+FWpsoG9Ek2rSL1x77B96GmJN2yLFsFw
 3Nf99gv4Ay1/Bsl8zhuZQzrDuTLyHkhV9N55G7/7FLKZ29OXyQQudi5OB/TbQZJU+Yjw
 gKYA==
X-Gm-Message-State: AOAM5315VJ1DTjpqLoXMxDCJUAeEizpGJM6t2qnv897X355KkUKCsy6y
 nZ90SUeVGfNeowXbbml0BzlS2w==
X-Google-Smtp-Source: ABdhPJzbwskN0/DtlHJAnLQ+QGQOrP7nWCPTapxvskUZYyaFE6IclN+YtQFx90fJdJW1BNlHHFUELw==
X-Received: by 2002:a05:620a:150f:: with SMTP id
 i15mr8871793qkk.152.1596292832181; 
 Sat, 01 Aug 2020 07:40:32 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id f53sm14352016qta.84.2020.08.01.07.40.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Aug 2020 07:40:31 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1k1sgY-002RlQ-Ap; Sat, 01 Aug 2020 11:40:30 -0300
Date: Sat, 1 Aug 2020 11:40:30 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Dan Carpenter <dan.carpenter@oracle.com>
Message-ID: <20200801144030.GM24045@ziepe.ca>
References: <20200730192026.110246-1-yepeilin.cs@gmail.com>
 <20200731045301.GI75549@unreal> <20200731053306.GA466103@kroah.com>
 <20200731053333.GB466103@kroah.com>
 <20200731140452.GE24045@ziepe.ca>
 <20200731142148.GA1718799@kroah.com>
 <20200731143604.GF24045@ziepe.ca>
 <20200731171924.GA2014207@kroah.com>
 <20200731182712.GI24045@ziepe.ca> <20200801080026.GJ5493@kadam>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200801080026.GJ5493@kadam>
Cc: rds-devel@oss.oracle.com, Arnd Bergmann <arnd@arndb.de>,
 Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org,
 Santosh Shilimkar <santosh.shilimkar@oracle.com>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Peilin Ye <yepeilin.cs@gmail.com>
Subject: Re: [Linux-kernel-mentees] [PATCH net] rds: Prevent kernel-infoleak
 in rds_notify_queue_get()
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

On Sat, Aug 01, 2020 at 11:00:26AM +0300, Dan Carpenter wrote:
> > Without an actual example where this doesn't work right it is hard to
> > say anything more..
> 
> Here is the example that set off the recent patches:
> 
> https://lkml.org/lkml/2020/7/27/199

Oh, that is something completely different. This thread was talking
about '= {}'.

From a C11 perspective the above link is complete initialization of an
aggregate and does not trigger the rule requiring that padding be
zero'd.

C11 only zeros padding during *partial* initialization of an aggregate.

ie this does not zero padding:

void test(void)
{
        extern void copy(const void *ptr, size_t len);
	struct rds_rdma_notify {
		unsigned long user_token;
		unsigned char status __attribute__((aligned(32)));
	} foo = {1, 1};

	// Padding NOT zeroed
	copy(&foo, sizeof(foo));
}

While the addition of a xxx member to make it partial initialization
does zero:

void test(void)
{
        extern void copy(const void *ptr, size_t len);
	struct rds_rdma_notify {
		unsigned long user_token;
		unsigned char status __attribute__((aligned(32)));
		unsigned long xx;
	} foo = {1, 1};

	// Padding NOT zeroed
	copy(&foo, sizeof(foo));
}

(and godbolt confirms this on a wide range of compilers)

> The rest of these patches were based on static analysis from Smatch.
> They're all "theoretical" bugs based on the C standard but it's
> impossible to know if and when they'll turn into real life bugs.

Any patches replaing '= {}' (and usually '= {0}') with memset are not
fixing anything.

The C11 standard requires zeroing padding in these case. It is just
useless churn and in some cases results in worse codegen.

smatch should only warn about this if the aggregate initialization is
not partial.

Jason
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
