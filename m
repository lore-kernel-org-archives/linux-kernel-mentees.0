Return-Path: <SRS0=164v=Z4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25DF9C43603
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  6 Dec 2019 19:26:07 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E32E9206DF
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  6 Dec 2019 19:26:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=hammerspace.com header.i=@hammerspace.com header.b="ek22Sg1s"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E32E9206DF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=hammerspace.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id B9D7089230;
	Fri,  6 Dec 2019 19:26:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q2LgNaZgHgUX; Fri,  6 Dec 2019 19:26:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id DBA2689228;
	Fri,  6 Dec 2019 19:26:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C3425C18DD;
	Fri,  6 Dec 2019 19:26:04 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 59852C077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Dec 2019 19:26:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 47DE489230
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Dec 2019 19:26:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d8QcfZjTCCUr
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Dec 2019 19:26:02 +0000 (UTC)
X-Greylist: delayed 00:43:28 by SQLgrey-1.7.6
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2108.outbound.protection.outlook.com [40.107.94.108])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 2BAE089228
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Dec 2019 19:26:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MNeQUG9sL9sS5ZRbTeb0Q5Q/Pu8I7sHe0JjJ03Szl1eMMBoai/khAIlbCie+6Gc96lcal1Z7Or/McNlHUGNs+PQ5hxk6jva7txbtR+0dG6MQpmA9Vxl2Lcvu7yTrrcJAENWSEFlVlcOTE9kxSaxFGpCewFgUt8UBBoz9VY/NhzGzNyk06O+fLY1CYWD32N2jUsg3M13E57ElxS/UCMBEU23JAXSW8eanoiC6Iron4nOBu3bCIsZb+i1ucXUg/IHgjs4ZzYqj6ZwzbW6vWyrhqFJZTul9+NbkHzvgEJGfbDnapYHbsXFrVfXDcSU7CJzxWhZcCWyI/L8N4q6y3rcnQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pBBgBW+lbbplum7iVCngRLCHZ2IiQ4aM/t38K44Fx24=;
 b=H63OAl14sbSV4FqTAOejFyHQA0UkA4mpvHfNpAIc4m+F0bViu333QZ3OTOr4m+O4ixYKpKADESOleqViLPoS91apiyzdjRWTnthkBQgbkx8beam2IayBJZ1zkOOcPKmRJksa+fzrdCklsOKW553JTEsWGdI4jra1kJbAU3P6/iwF0y/mtdCy0O9emqHmXUn5JCLxT+hCIt3oiqfM5/enZeavufEUygiHZC6F7z3G8Ll5BVlgwBrdtygEpkhko76QFOjnQPq+gP52FZaEI7JSEjphO9Zgw4S7XWG3g8JOFXXxmAElvZVFzkMdGcpNOE0Bl5huoH9aEYZ5PAbGwtk/YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hammerspace.com; dmarc=pass action=none
 header.from=hammerspace.com; dkim=pass header.d=hammerspace.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hammerspace.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pBBgBW+lbbplum7iVCngRLCHZ2IiQ4aM/t38K44Fx24=;
 b=ek22Sg1sV8qg3VXHpvyVtL6XuKjMEVR8Mm8ACem4AuFr21z3LGo9Z6A+phpUoRz5Sk7cITLZN6Sv33DU+P+nzBQDLHa4FR+OALlvK0I3KAWHEmyjYwelRKaOQ8Cq0AElgNOLmE874P4hTYDIRKQj25K/Z2J+KhGNHhlf+uIXkrg=
Received: from DM5PR1301MB2108.namprd13.prod.outlook.com (10.174.186.34) by
 DM5PR1301MB1962.namprd13.prod.outlook.com (10.174.184.160) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.4; Fri, 6 Dec 2019 17:52:10 +0000
Received: from DM5PR1301MB2108.namprd13.prod.outlook.com
 ([fe80::2d23:b456:d67:f230]) by DM5PR1301MB2108.namprd13.prod.outlook.com
 ([fe80::2d23:b456:d67:f230%6]) with mapi id 15.20.2516.017; Fri, 6 Dec 2019
 17:52:10 +0000
From: Trond Myklebust <trondmy@hammerspace.com>
To: "paulmck@kernel.org" <paulmck@kernel.org>, "madhuparnabhowmik04@gmail.com"
 <madhuparnabhowmik04@gmail.com>
Thread-Topic: [PATCH 2/2] fs: nfs: dir.c: Fix sparse error
Thread-Index: AQHVrEg0Ten5696hykeZOOX4T18u0aetRJkAgAAemAA=
Date: Fri, 6 Dec 2019 17:52:10 +0000
Message-ID: <2ec21ec537144bb3c0d5fbdaf88ea022d07b7ff8.camel@hammerspace.com>
References: <20191206151640.10966-1-madhuparnabhowmik04@gmail.com>
 <20191206160238.GE2889@paulmck-ThinkPad-P72>
In-Reply-To: <20191206160238.GE2889@paulmck-ThinkPad-P72>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=trondmy@hammerspace.com; 
x-originating-ip: [88.95.63.95]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4b2813b6-f24f-4f89-df0b-08d77a7504d2
x-ms-traffictypediagnostic: DM5PR1301MB1962:
x-microsoft-antispam-prvs: <DM5PR1301MB19625B3D0CBABA8E74A4BDFBB85F0@DM5PR1301MB1962.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0243E5FD68
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39830400003)(376002)(396003)(136003)(346002)(366004)(189003)(199004)(66446008)(508600001)(64756008)(2906002)(54906003)(26005)(8676002)(110136005)(229853002)(76116006)(91956017)(66476007)(2616005)(102836004)(36756003)(6486002)(4326008)(66556008)(5660300002)(186003)(316002)(76176011)(118296001)(66946007)(305945005)(99286004)(6506007)(71190400001)(71200400001)(8936002)(6512007)(81166006)(81156014)(86362001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR1301MB1962;
 H:DM5PR1301MB2108.namprd13.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: hammerspace.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: B1sKE9HcNAbQ9JZwVVnFC3mdOr6xHw1WkyDrRWTgUOk2JpiJMV5yRoc2fu/phXIQuM6sMkFHQ2+rNHyVgJuQm2Cd5lPRN7QaDjP7RWbT+ZSuppry0gMDZYt5buDnv+bO1zT+wm3l/JVcMh3AoJwWd3qPlbxARjbVzK0F9L67vlXhcWVLm17WEOe4EboSJiUC0IItIrgr5VpMZFJbLJno7tcbBAM63Tw2S+SvOUaDRq1TN9VmxVYZ+hE9Y1YthfpOU6nZEHYeGsiTdfDaa7C/nHzrFKBryWlSwSqlyEPTM28gHAKB63GL5NKT+xq36ZWVkb7cjzsJqUOc1MWBU6bWansrOpgamZTPpXmbfiK3kxIz1UYo4Fm0XXAW+cylZUPxe2Mt46oeclPxs7MSrRvbA5CqMPS4k1kdLJI3PSoG8Ykpae78zemm7Ted21ae1aOC
x-ms-exchange-transport-forked: True
Content-ID: <87B74384B4FA6C48A324B0DD2BE0D477@namprd13.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: hammerspace.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b2813b6-f24f-4f89-df0b-08d77a7504d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2019 17:52:10.5476 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4fed5c-3a70-46fe-9430-ece41741f59e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jrjA+r5zdwZ6zcu8GjAMQ1d0O/sGpSsXD3DMiuKXnQC7K4inSG4qs6FstifRJRXzDsZpgmZ4td2IPs2Mna376A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1301MB1962
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

Hi Paul,

On Fri, 2019-12-06 at 08:02 -0800, Paul E. McKenney wrote:
> On Fri, Dec 06, 2019 at 08:46:40PM +0530, 
> madhuparnabhowmik04@gmail.com wrote:
> > From: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
> > 
> > This patch fixes the following errors:
> > fs/nfs/dir.c:2353:14: error: incompatible types in comparison
> > expression (different address spaces):
> > fs/nfs/dir.c:2353:14:    struct list_head [noderef] <asn:4> *
> > fs/nfs/dir.c:2353:14:    struct list_head *
> > 
> > caused due to directly accessing the prev pointer of
> > a RCU protected list.
> > Accessing the pointer using the macro list_prev_rcu() fixes this
> > error.
> > 
> > Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
> > ---
> >  fs/nfs/dir.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/fs/nfs/dir.c b/fs/nfs/dir.c
> > index e180033e35cf..2035254cc283 100644
> > --- a/fs/nfs/dir.c
> > +++ b/fs/nfs/dir.c
> > @@ -2350,7 +2350,7 @@ static int nfs_access_get_cached_rcu(struct
> > inode *inode, const struct cred *cre
> >  	rcu_read_lock();
> >  	if (nfsi->cache_validity & NFS_INO_INVALID_ACCESS)
> >  		goto out;
> > -	lh = rcu_dereference(nfsi->access_cache_entry_lru.prev);
> > +	lh = rcu_dereference(list_prev_rcu(&nfsi-
> > >access_cache_entry_lru));
> 
> And as noted in the earlier email, what is preventing concurrent
> insertions into  and deletions from this list?
> 
> o	This use of list_move_tail() is OK because it does not poison.
> 	Though it isn't being all that friendly to lockless access to
> 	->prev -- no WRITE_ONCE() in list_move_tail().
> 
> o	The use of list_add_tail() is not safe with RCU readers, though
> 	they do at least partially compensate via use of smp_wmb()
> 	in nfs_access_add_cache() before calling
> nfs_access_add_rbtree().
> 
> o	The list_del() near the end of nfs_access_add_rbtree() will
> 	poison the ->prev pointer.  I don't see how this is safe given
> the
> 	possibility of a concurrent call to
> nfs_access_get_cached_rcu().

The pointer nfsi->access_cache_entry_lru is the head of the list, so it
won't get poisoned. Furthermore, the objects it points to are freed
using kfree_rcu(), so they will survive as long as we hold the rcu read
lock. The object's cred pointers also points to something that is freed
in an rcu-safe manner.

The problem here is rather that a racing list_del() can cause nfsi-
>access_cache_entry_lru to be empty, which is presumably why Neil added
that check plus the empty cred pointer check in the following line.

The barrier semantics may be suspect, although the spin unlock after
list_del() should presumably guarantee release semantics?


-- 
Trond Myklebust
Linux NFS client maintainer, Hammerspace
trond.myklebust@hammerspace.com


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
