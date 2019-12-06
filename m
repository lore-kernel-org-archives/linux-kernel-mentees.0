Return-Path: <SRS0=164v=Z4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF041C43603
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  6 Dec 2019 21:01:40 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6252224670
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  6 Dec 2019 21:01:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=hammerspace.com header.i=@hammerspace.com header.b="dxLgrCJo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6252224670
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=hammerspace.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 31517891EE;
	Fri,  6 Dec 2019 21:01:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id epRJy7x07uDl; Fri,  6 Dec 2019 21:01:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id C000D88F85;
	Fri,  6 Dec 2019 21:01:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ADBF1C1D7D;
	Fri,  6 Dec 2019 21:01:38 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C5143C077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Dec 2019 21:01:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id ABD9287854
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Dec 2019 21:01:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VU9V5-2zUOXl
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Dec 2019 21:01:35 +0000 (UTC)
X-Greylist: delayed 02:00:20 by SQLgrey-1.7.6
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2090.outbound.protection.outlook.com [40.107.236.90])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 1412487811
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Dec 2019 21:01:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ri4ersjeel3twrapXtcFgR5dnTsk83P6mlirnZDopfLIt0lHZV0CiZkNC0H444AhX/g94+mC3xJwkoWOOFocLuexIjMxt/2Ldw6FyLLoYkiZyP79c3vaEmp88+oco5oGeplMTFPPN3zx6AFsQt8uqaqpZK5cEPR0qgdsnu6sxkx5ItazX432lvnXlOQMJRYP8umCYkMeS1uv7JmXH3ThGvwgpOmed5bgI3VKl1J2pCWlz+5hOxetxEw9pYZUo4gkwgoK5B0g5/3MaiFb4a/qTv+fYG+9xaH0W5SjCDnrPx8d/t97Ltnah4zJuvUH3oXF2mLauwzqUk38Ku91QJP+uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LPJ8D+7uhe5ud9ajmAgm7FScvYQe6ajkGRhr1Pa2a38=;
 b=R2OOVdINCeFmE36na0EWguNdSIpQXI9BQTTNMl8fxNRnm//H7+V1nuNMn3RqbBokrv6+CgWMrYzdWuzWNkKK+h6A54UUAEO+0DuAVfHlP9yAYV4DD8sLiKLfd5GPCsXZDDh2crIMT2OnhTg/UdcWd49bIALImP2lN/GpeNj6F/WW9cQE32JFo2HLONnxEPmJdRSHn/vHDSvZk5KW0jn2BZvHQXDtlge+Gk+UFwG7I59ksjmDdUop3Rjj2yg+el/2UvQgokW2iInv8PJnw+iehGBfSzFnxQy5M8yObGrNuSE/ZvHz5FnI5Qq+PxqScdgYyaUNg7205aFLrgwgZt2M9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hammerspace.com; dmarc=pass action=none
 header.from=hammerspace.com; dkim=pass header.d=hammerspace.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hammerspace.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LPJ8D+7uhe5ud9ajmAgm7FScvYQe6ajkGRhr1Pa2a38=;
 b=dxLgrCJoc+kweqRVOfEEXjcMWLk2EA4CpQnPdvH7aom3WvhksP1I7OwuCpFBuM4wa61l88OBFINPf94h4XLFCHjtKPL3o6HtZdOHcH5qyzI1SLY2sR1cmA4wIqB8uoKdlJeTtzWl6q099J7fd6bvijiHn/79fCgOvdC7VXgFrv4=
Received: from DM5PR1301MB2108.namprd13.prod.outlook.com (10.174.186.34) by
 DM5PR1301MB2170.namprd13.prod.outlook.com (10.174.184.147) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.8; Fri, 6 Dec 2019 18:28:14 +0000
Received: from DM5PR1301MB2108.namprd13.prod.outlook.com
 ([fe80::2d23:b456:d67:f230]) by DM5PR1301MB2108.namprd13.prod.outlook.com
 ([fe80::2d23:b456:d67:f230%6]) with mapi id 15.20.2516.017; Fri, 6 Dec 2019
 18:28:14 +0000
From: Trond Myklebust <trondmy@hammerspace.com>
To: "paulmck@kernel.org" <paulmck@kernel.org>
Thread-Topic: [PATCH 2/2] fs: nfs: dir.c: Fix sparse error
Thread-Index: AQHVrEg0Ten5696hykeZOOX4T18u0aetRJkAgAAemACAAAj4AIAAARsA
Date: Fri, 6 Dec 2019 18:28:14 +0000
Message-ID: <127792d6811173921733542052f061a18991f441.camel@hammerspace.com>
References: <20191206151640.10966-1-madhuparnabhowmik04@gmail.com>
 <20191206160238.GE2889@paulmck-ThinkPad-P72>
 <2ec21ec537144bb3c0d5fbdaf88ea022d07b7ff8.camel@hammerspace.com>
 <20191206182414.GH2889@paulmck-ThinkPad-P72>
In-Reply-To: <20191206182414.GH2889@paulmck-ThinkPad-P72>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=trondmy@hammerspace.com; 
x-originating-ip: [88.95.63.95]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 52516442-5a4a-4057-5f6e-08d77a7a0ed1
x-ms-traffictypediagnostic: DM5PR1301MB2170:
x-microsoft-antispam-prvs: <DM5PR1301MB2170803BEEE3BF2C7E35BC71B85F0@DM5PR1301MB2170.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 0243E5FD68
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(346002)(396003)(136003)(39840400004)(366004)(199004)(189003)(54906003)(6512007)(118296001)(8676002)(86362001)(99286004)(66556008)(66476007)(81156014)(1730700003)(76116006)(2616005)(66446008)(64756008)(508600001)(305945005)(5640700003)(91956017)(229853002)(81166006)(316002)(66946007)(26005)(71190400001)(71200400001)(5660300002)(2906002)(102836004)(8936002)(186003)(36756003)(4326008)(76176011)(6916009)(6486002)(6506007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR1301MB2170;
 H:DM5PR1301MB2108.namprd13.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: hammerspace.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: q6a6IQNNwYzqMP+wUi0SLsRyFX8XASWLF3IOLmSyZXnAbsdnh7MXQaIdqjH5izSVzVVHWbh1gi1HQL8Ln25CoUlkvuRJElkMJRDJSdcd6Un29bSfrfB/DJ9xv0dfN5Vz8GBJPM8VMy9uv1b4EbQkWnArbdLJBfj+VCB6CKcegVXpSnBrV4EEsL4wflUY0+V0Ek4nIYcVN6oYtnsFhtflUEPrHCyRag+5aLbN4CZtSj2KVwaHMRh1RzhiDIYOlDrdMgdR7fJboZeS4jKpL2WMTxssQPGf/mWcDTOSmInpToTIc1Xgf1wc+FJVTnq0usq3dpu4PfJ6g/wDyW5HlGrgf9rU9GFMJ07T8F9sEUeq/FHHGlCbFB05OIjZYrPkCO0hS+rtEickQ7lqyalCXi3RzbtZ4bEbDY9nHc+IDOWSlfxlJOWQaN3lD8KKU1HrREYS
x-ms-exchange-transport-forked: True
Content-ID: <C3C06C068ACA064C8DBA722A46859A79@namprd13.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: hammerspace.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52516442-5a4a-4057-5f6e-08d77a7a0ed1
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2019 18:28:14.8446 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4fed5c-3a70-46fe-9430-ece41741f59e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ym2MgMWNkVgJ2ekk2mYuIqus2tOKYIh1GVfmhmEsieg3n3fljYRvx1TnnrryayNLvhi7D3JymRiyCUUxlrdhrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1301MB2170
Cc: "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rcu@vger.kernel.org" <rcu@vger.kernel.org>,
 "joel@joelfernandes.org" <joel@joelfernandes.org>,
 "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 "anna.schumaker@netapp.com" <anna.schumaker@netapp.com>
Subject: Re: [Linux-kernel-mentees] [PATCH 2/2] fs: nfs: dir.c: Fix sparse
	error
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

On Fri, 2019-12-06 at 10:24 -0800, Paul E. McKenney wrote:
> On Fri, Dec 06, 2019 at 05:52:10PM +0000, Trond Myklebust wrote:
> > Hi Paul,
> > 
> > On Fri, 2019-12-06 at 08:02 -0800, Paul E. McKenney wrote:
> > > On Fri, Dec 06, 2019 at 08:46:40PM +0530, 
> > > madhuparnabhowmik04@gmail.com wrote:
> > > > From: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
> > > > 
> > > > This patch fixes the following errors:
> > > > fs/nfs/dir.c:2353:14: error: incompatible types in comparison
> > > > expression (different address spaces):
> > > > fs/nfs/dir.c:2353:14:    struct list_head [noderef] <asn:4> *
> > > > fs/nfs/dir.c:2353:14:    struct list_head *
> > > > 
> > > > caused due to directly accessing the prev pointer of
> > > > a RCU protected list.
> > > > Accessing the pointer using the macro list_prev_rcu() fixes
> > > > this
> > > > error.
> > > > 
> > > > Signed-off-by: Madhuparna Bhowmik <
> > > > madhuparnabhowmik04@gmail.com>
> > > > ---
> > > >  fs/nfs/dir.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > 
> > > > diff --git a/fs/nfs/dir.c b/fs/nfs/dir.c
> > > > index e180033e35cf..2035254cc283 100644
> > > > --- a/fs/nfs/dir.c
> > > > +++ b/fs/nfs/dir.c
> > > > @@ -2350,7 +2350,7 @@ static int
> > > > nfs_access_get_cached_rcu(struct
> > > > inode *inode, const struct cred *cre
> > > >  	rcu_read_lock();
> > > >  	if (nfsi->cache_validity & NFS_INO_INVALID_ACCESS)
> > > >  		goto out;
> > > > -	lh = rcu_dereference(nfsi-
> > > > >access_cache_entry_lru.prev);
> > > > +	lh = rcu_dereference(list_prev_rcu(&nfsi-
> > > > > access_cache_entry_lru));
> > > 
> > > And as noted in the earlier email, what is preventing concurrent
> > > insertions into  and deletions from this list?
> > > 
> > > o	This use of list_move_tail() is OK because it does not poison.
> > > 	Though it isn't being all that friendly to lockless access to
> > > 	->prev -- no WRITE_ONCE() in list_move_tail().
> > > 
> > > o	The use of list_add_tail() is not safe with RCU readers, though
> > > 	they do at least partially compensate via use of smp_wmb()
> > > 	in nfs_access_add_cache() before calling
> > > nfs_access_add_rbtree().
> > > 
> > > o	The list_del() near the end of nfs_access_add_rbtree() will
> > > 	poison the ->prev pointer.  I don't see how this is safe given
> > > the
> > > 	possibility of a concurrent call to
> > > nfs_access_get_cached_rcu().
> > 
> > The pointer nfsi->access_cache_entry_lru is the head of the list,
> > so it
> > won't get poisoned. Furthermore, the objects it points to are freed
> > using kfree_rcu(), so they will survive as long as we hold the rcu
> > read
> > lock. The object's cred pointers also points to something that is
> > freed
> > in an rcu-safe manner.
> > 
> > The problem here is rather that a racing list_del() can cause nfsi-
> > > access_cache_entry_lru to be empty, which is presumably why Neil
> > > added
> > that check plus the empty cred pointer check in the following line.
> > 
> > The barrier semantics may be suspect, although the spin unlock
> > after
> > list_del() should presumably guarantee release semantics?
> 
> Ah, OK, so you are only ever using ->prev only from the head of the
> list,
> and presumably never do list_del() on the head itself.  (Don't laugh,
> this does really happen as a way to remove the entire list, though
> perhaps with list_del_init() rather than list_del().)

Correct.

> Maybe we should have a list_tail_rcu() that is only expected to work
> on the head of the list?
> 

That might be the best way to resolve this, yes.

-- 
Trond Myklebust
Linux NFS client maintainer, Hammerspace
trond.myklebust@hammerspace.com


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
